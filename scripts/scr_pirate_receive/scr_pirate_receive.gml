function scr_pirate_receive() {
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
			ins = instance_create(0,0,pirate_game);
	        ins.alarm[3] = 1;
	        ins.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
	        random_set_seed(buffer_read(buffer,buffer_u8));
			global.baseTreasure = round(0.25*buffer_read(buffer,buffer_u8));
			room_goto(choose(room2,room21,room211,room2111));
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
	    case 9:
	        readying = buffer_read(buffer,buffer_bool);
	        if(readying == true) 
	            global.ready++;
	        else
	            global.ready--;
	    break;
	    case 5:
	        dead = buffer_read(buffer,buffer_u8);
			lootdrop = buffer_read(buffer,buffer_u8);
			var killer = buffer_read(buffer,buffer_u8);
			if(instance_exists(pirate_player) && pirate_player.beast) {
				if(killer == obj_client.index) {//if kill as beast
					pirate_player.victims++;
					pirate_player.hp = 250;
					if(pirate_player.victims == 2)
						global.loot++;
				}
			}
			if(instance_exists(pirate_player) && pirate_player.MTF) {
				if(killer == obj_client.index) {//if killed pirate
					if(scr_IsAPirate(dead)) {
						//global.loot += 1;
					}
					else if(global.loot > 0){
						global.loot -= 1;
					}
			}
			}
	        scr_kill(dead,lootdrop);
	    break;
	    case 6: //damage through melee
	        if(instance_exists(obj_player)) {
	            num = buffer_read(buffer,buffer_u8);
	            obj_player.hp -= buffer_read(buffer,buffer_u8);
	        }
	    break;
	    case 7: //bullet
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
	        dir = buffer_read(buffer,buffer_u16);
	        ob = buffer_read(buffer,buffer_u16);
	        bullet = instance_create(xp,yp,ob);
	        bullet.num = buffer_read(buffer,buffer_u8);
	        /*if(ob == obj_grenade)
	            bullet.alarm[0] = buffer_read(buffer,buffer_u8)+1;*/
	        bullet.direction = dir;
	        bullet.image_angle = dir;
	        //bullet.speed = 20;
	    break;
	    case 8: //bolt aim
			num = buffer_read(buffer,buffer_u8);
			scr_marked(num);
	    break;
	    case 10:
	        num = buffer_read(buffer,buffer_u8);
	        ob = instance_create(0,0,obj_minefield);
	        ob.num = num;
	    break;
	    case 11:
	        num = buffer_read(buffer,buffer_u8);
	        ob = instance_create(0,0,obj_win);
	        ob.num = num;
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
			room_goto(win_screen);
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
