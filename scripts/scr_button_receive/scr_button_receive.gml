function scr_button_receive() {
	var buffer = argument[0];
	var message_id = buffer_read(buffer, buffer_u8);
	switch(message_id) {
	    case 0:
	        global.game = buffer_read(buffer,buffer_string);
	    case 1: 
	        //index = buffer_read(buffer, buffer_u8);
	        xp = buffer_read(buffer, buffer_u16);
	        yp = buffer_read(buffer, buffer_u16);
	        //scr_others(xp,yp);
	        //var mx = buffer_read(buffer,buffer_u16);
	        //var my = buffer_read(buffer,buffer_u16);
	    break;
	    case 2: 
	        global.ready = 0;
	        obj_client.ready = false;
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
			ins = instance_create(0,0,button_game);
	        ins.alarm[3] = 1;
	        global.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
			ins.num = obj_client.index
	        random_set_seed(buffer_read(buffer,buffer_u8));
			room_goto(quantum_room);
	    break;
	    case 3://player positions and hp
	        /*num = buffer_read(buffer,buffer_u8);
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
	        //alpha = buffer_read(buffer,buffer_u8);
	        ob = global.players[num];
			ob.x = xp;
			ob.y = yp;
			ob.hp = buffer_read(buffer,buffer_u8);
			ob.dc = 90;*/
	        num = buffer_read(buffer,buffer_u8);
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
	        hp = buffer_read(buffer,buffer_u8);
	        scr_pirate_others(num,xp,yp,hp);
	    break;
	    case 5: //die
			num = buffer_read(buffer,buffer_u8);
			global.buttons[num] = 1;
	    break;
	    case 6: //send ready
			levelUp = buffer_read(buffer,buffer_bool);
			if(levelUp) {
				button_game.challenges--;
				if(button_game.challenges < 1) {
					button_game.level++;
					button_game.alarm[3] = 1;
				}
			}
			else
				button_game.alarm[3] = 1;
	    break;
	    case 7: //send actions
			up = buffer_read(buffer,buffer_bool);
			if(up) {
				global.readied++;
				if(global.readied > 1) {
					if(global.talking)
						button_game.alarm[4] = 1;
					else
						button_game.alarm[3] = 1;
				}
			}
			else
				global.readied--;
			
	    break;
	    case 8: //recieve scores
			num = buffer_read(buffer,buffer_u8);
			global.gunScore[num] = buffer_read(buffer,buffer_f32)
			show_debug_message(string(num) + ": " + string(global.gunScore[num]))
			show_debug_message(string(global.scored));
			global.scored++;
			if(global.gunScore[num] > global.highGunScore) {
				global.highGunScore = global.gunScore[num]
				global.highGunScorer = num;
				show_debug_message("Surpassed");
			}
			if(global.scored == global.loop) {
				global.gun = global.highGunScorer
				global.highGunScore = 0
				global.scored = 0;
			}
			/*if(global.scored = global.loop) {
				global.scored = 0;
				i = 1;
				var highest = 0;
				var highestI = 1;
				repeat(global.loop) {
					if(global.gunScore[i] > highest) {
						highest = global.gunScore[i];
						highestI = i;
					}
					i++;
				}
				global.gun = highestI
			}*/
	    break;
	    case 10:
	        num = buffer_read(buffer,buffer_u8);
			up = buffer_read(buffer,buffer_bool)
			if(up > global.switchLiving/2) { //vote counted, maybe vote someone out
				global.votes[num]++;
				if(global.votes[num] > global.loop/2)
					scr_resetVote(num)
			}
			else
				global.votes[num]--;
	    break;
	    case 11: //blackout
			if(global.imp == false) {
				with(obj_message) {
					instance_destroy();
				}
			}
			global.blackout = 10;
	    break;
	    case 12:
			scr_unleash();
			scr_text(5,"The beast has been unleashed!");
	    break;
	    case 13:
	        num = buffer_read(buffer,buffer_u8);
	        ins = instance_create(500,500,other_bolt);
	        ins.num = num;
	        ins.fire = buffer_read(buffer,buffer_u8);
	    break;
	    case 14: //recieve names
	        num = buffer_read(buffer,buffer_u8);
	        global.names[num] = buffer_read(buffer,buffer_string);
	    break;
	    case 15: //who wins a game
	        num = buffer_read(buffer,buffer_u8);
	        ins = instance_create(0,0,gui_win);
	        ins.num = num;
	    break;
	    case 16:
	        index = buffer_read(buffer,buffer_u8);
	        //global.deaths[index] = buffer_read(buffer,buffer_u8);
	        global.wins[index] = buffer_read(buffer,buffer_u8);
			global.kills[index] = buffer_read(buffer,buffer_u8);
	    break;
		case 17: //go to end screen
			global.winning = buffer_read(buffer,buffer_u8);
			global.booty = buffer_read(buffer,buffer_u8);
			room_goto(6);
	            if(instance_exists(inst_game)) { //delete the old game object to show score
	                instance_destroy(inst_game);
	            }
		break;
		case 20: //recieve bounties
			global.genGain = buffer_read(buffer,buffer_u8);
			global.killGain = buffer_read(buffer,buffer_u8);
		break;
	}



}
