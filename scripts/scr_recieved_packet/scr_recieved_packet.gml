function scr_recieved_packet() {
	var buffer = argument[0];
	message_id = buffer[? "eventName"]

	switch(global.game) {
	    case 0:
			if(message_id == "Lobbies") {
				lobbies = buffer[? "Lobbies"]
				var i = 0;
				xp = 300;
				repeat(1) {
					ins = instance_create(xp,350,obj_lobby);
					ins.numPlayers = lobbies[| i]
					i++;
					xp += 200;
				}
			}
	        else if(message_id == "Start Game") {
	            newgame = "Ball"
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
	            global.game = newgame; 
				scr_ball_receive(buffer)
	        }
			else if(message_id == "Num") {//recieve num and send name
				num = buffer[? "Number"]
				global.gameMode = buffer[? "Mode"]
				obj_client.index = int64(num);
				obj_client.alarm[6] = 1; //send packet
				obj_client.ping = current_time-obj_client.pingSet
				global.connected = true;
				obj_client.pingTime = 0;
				show_debug_message("Client Connected")
			}
			else if(message_id == "Ping") {
				num = buffer[? "Num"];
				//global.ping[num] = buffer[? "Ping"]
				if(num == obj_client.index) {
					obj_client.ping = current_time - buffer[? "clientTime"]
					estimatedServerTime = buffer[? "serverTime"] + obj_client.ping/2
					global.pingOffset = estimatedServerTime - current_time;
				}
			}
			else if(message_id = "Player UI") {
				show_debug_message(buffer)
				num = buffer[? "Number"];
				team = buffer[? "Team"];
				ready = buffer[? "Ready"];
				name = buffer[? "Name"];
				loadout = buffer[? "Loadout"];
				scr_createPlayer(num,name,team,ready, loadout);
			} else if(message_id = "Comp Loadout Pick") {
				num = buffer[? "playerDraftIndex"];
				obj_client.loadoutPickingIndex = num;
				if(num == obj_client.index) {
					obj_client.loadoutTimer = 30;
					obj_client.maxLoadoutTimer = 30;
				}
				
				if(!obj_client.loadoutPicking) { //if first one, remove all ready buttons
					with(obj_playerUI) {
						loadoutPicked = 0; 
						y -= 80;
						height = 70;
					}
					with(obj_loadouts) {
						if(str != "Back") {
							y = 650;
						}
					}
					if(num == obj_client.index) {
						obj_client.loadoutTimer = 60;
						obj_client.maxLoadoutTimer = 60;
					}
				}
				obj_client.loadoutPicking = true;

			} else if(message_id == "Rumble Set") {
				random_set_seed(buffer[? "Seed"]);
				obj_client.loadoutPickingIndex = buffer[? "playerIndex"]
				show_debug_message(obj_client.loadoutPickingIndex)
				show_debug_message(obj_client.index)
				scr_rumble_setup();
				if(obj_client.index == obj_client.loadoutPickingIndex) {
					obj_client.loadoutTimer = 25;
					obj_client.maxLoadoutTimer = 25;
				}
			} else if(message_id == "Rumble Select") {
				show_debug_message("Rumble select")
				
				var type = buffer[? "type"];
				show_debug_message(type)
				var selecterNum = buffer[? "Num"]
				var selectedIndex = buffer[? "Index"]
				obj_client.loadoutPickingIndex = buffer[? "playerDraftIndex"]
				scr_rumble_select(type, selecterNum, selectedIndex);
				if(buffer[? "rumblePicks"] >= 10) {
					obj_client.loadoutPickingIndex = -1;
					obj_client.loadoutTimer = 100;
				}
				if(obj_client.index == obj_client.loadoutPickingIndex) {
					obj_client.loadoutTimer = 15;
					obj_client.maxLoadoutTimer = 15;
				}
			}
			else if(message_id = "Player Disconnect") {   
				num = buffer[? "Name"];
				with(obj_playerUI) {
					if(named == other.num) {
						instance_destroy();
					}
				}
			}
	    break;
	    case "Shooter":
	        scr_shooter_receive(buffer);
	    break;
	    case "Pirates":
	        scr_pirate_receive(buffer);
	    break;
		case "Standoff":
			scr_standoff_receive(buffer);
		break;
		case "Trump":
			scr_trump_receive(buffer);
		break;
		case "Jumper":
			scr_jumper_receive(buffer);
		break;
		case "Switcheroo":
			scr_switch_receive(buffer);
		break;
		case "BlockFight":
			scr_block_receive(buffer);
		break;
		case "Ball":
			scr_ball_receive(buffer);
		break;
		case "Karts":
			scr_karts_receive(buffer)
		break;
		case "DrawShoot":
			scr_draw_receive(buffer);
		break;
		case "Mafia":
			scr_mafia_receive(buffer);
		break;
		case "Quantum":
			scr_button_receive(buffer);
		break;
	}
	/*
	var message_id = buffer_read(buffer, buffer_u8);
	switch(message_id) {
	    case 0:
	        global.game = buffer_read(buffer,buffer_string);
	    break;
	}


/* end scr_recieved_packet */
}
