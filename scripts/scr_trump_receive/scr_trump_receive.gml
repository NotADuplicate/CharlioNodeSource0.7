function scr_trump_receive() {
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
	        instance_create(xp,yp,obj_click);
	    break;
	    case 2: 
	        global.ready = 0;
	        obj_client.ready = false;
	        room_goto(trump_room51);
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
	        ins = instance_create(0,0,trump_game);
	        ins.alarm[3] = 1;
	        ins.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
	        random_set_seed(buffer_read(buffer,buffer_u8));
			global.mapSize = round(buffer_read(buffer,buffer_u8)/10);
			//if(buffer_read(buffer,buffer
	    break;
	    case 3://player positions and hp
	        num = buffer_read(buffer,buffer_u8);
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
	        dir = 2 * buffer_read(buffer,buffer_u8);
			pointing = 2 * buffer_read(buffer,buffer_u8);
	        scr_standoff_others(num,xp,yp,dir,pointing);
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
	        scr_trump_kill(dead);
	    break;
	    case 6: //damage through melee
	        if(instance_exists(obj_player)) {
	            num = buffer_read(buffer,buffer_u8);
	            obj_player.hp -= buffer_read(buffer,buffer_u8);
	        }
	    break;
	    case 7: //wall built
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
			instance_create(xp,yp,defo_wall);
			if(instance_exists(trump_player)) //potentiall be trapped
				trump_player.alarm[3] = 3;
			with(trump_other)
				alarm[3] = 1;
	    break;
	    case 8: //move other
			num = buffer_read(buffer,buffer_u8);
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
			scr_trump_others(num,xp,yp);
			if(instance_exists(trump_player)) //potentiall be trapped
				trump_player.alarm[3] = 3;
			with(trump_other)
				alarm[3] = 1;
	    break;
	    case 10: //become turn
	        num = buffer_read(buffer,buffer_u8);
			global.turn = num;
			if(num == obj_client.index) {
				if(global.dead) {
					trump_game.alarm[1] = 1;
				}
				else {
					trump_player.turn = true;
				}
			}
	    break;
	    case 11:
	        num = buffer_read(buffer,buffer_u8);
	        ob = instance_create(0,0,obj_win);
	        ob.num = num;
	    break;
	    case 12: //CNN wall moves
	        num = buffer_read(buffer,buffer_u8);
			xp = buffer_read(buffer,buffer_u16);
			yp = buffer_read(buffer,buffer_u16);
	        scr_CNN_other(num,xp,yp);
	    break;
	    case 13: //CNN WALL
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
			instance_create(xp,yp,player_CNN);
			if(instance_exists(trump_player)) //potentiall be trapped
				trump_player.alarm[3] = 3;
			with(trump_other)
				alarm[3] = 1;
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
	        global.deaths[index] = buffer_read(buffer,buffer_u8);
	        global.kills[index] = buffer_read(buffer,buffer_u8);
	        global.wins[index] = buffer_read(buffer,buffer_u8);
	    break;
	    case 17: //who wins a game
	        var teamwin = buffer_read(buffer,buffer_u8);
	        ins = instance_create(0,0,gui_win);
	        ins.teamwin = teamwin;
			ins.num = -1;
	    break;
	
	}



}
