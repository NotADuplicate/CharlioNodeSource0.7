function scr_draw_receive() {
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
			ins = instance_create(0,0,draw_game);
	        ins.alarm[3] = 1;
	        global.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
			ins.num = obj_client.index
	        random_set_seed(buffer_read(buffer,buffer_u8));
			room_goto(drawShoot);
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
	    case 6: //send ready
			num = buffer_read(buffer,buffer_u8);
			global.players[num].ready = buffer_read(buffer,buffer_bool)
			everyoneReady = true;
			i = 1;
			repeat(global.loop) {
				if(global.players[i].ready == false && global.players[i].hp > 0)
					everyoneReady = false
				i++;
			}
			if(everyoneReady)
				scr_draw_ready()
	    break;
	    case 7: //send actions
			user = buffer_read(buffer,buffer_u8);
			actionIndex = buffer_read(buffer,buffer_u8);
			global.userActions[user,actionIndex] = buffer_read(buffer,buffer_string);
			global.userActionTarget[user,actionIndex] = buffer_read(buffer,buffer_u8);
			global.players[user].action[actionIndex] = global.userActions[user,actionIndex]
			draw_game.alarm[4] = 30;
	    break;
	    case 8: //bolt aim
			num = buffer_read(buffer,buffer_u8);
			scr_marked(num);
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
