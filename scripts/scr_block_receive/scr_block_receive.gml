function scr_block_receive() {
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
	        room_goto(8);
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
	        ins = instance_create(0,0,block_game);
	        ins.alarm[3] = 1;
	        ins.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
	        random_set_seed(buffer_read(buffer,buffer_u8));
			global.roundLength = buffer_read(buffer,buffer_u8)*3
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
	        scr_blockDie(dead);
	    break;
	    case 6: //damage through melee
	        if(instance_exists(obj_player)) {
	            num = buffer_read(buffer,buffer_u8);
	            obj_player.hp -= buffer_read(buffer,buffer_u8);
	        }
	    break;
	    case 7: //get shot
			var num = buffer_read(buffer,buffer_u8)
			var hp = buffer_read(buffer,buffer_u8)
			scr_blockDamage(num,hp)
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
			xp = buffer_read(buffer,buffer_u16)
			yp = buffer_read(buffer,buffer_u16)
			ap = buffer_read(buffer,buffer_u8);
			range = buffer_read(buffer,buffer_u8)
			scr_blockUpdate(num,xp,yp,ap,range)
	    break;
	    case 11:
	        num = buffer_read(buffer,buffer_u8);
			block_game.alarm[2] = 1;
			if(num == obj_client.index)
				global.AP++;
	    break;
	    case 12: //Receive Message
			num = buffer_read(buffer,buffer_u8)
			if(num == obj_client.index) {
				num = buffer_read(buffer,buffer_u8)
				name = global.names[num];
				mess = buffer_read(buffer,buffer_string)
					ins = instance_create(80,2100,obj_message)
					ins.name = name;
					ins.message = mess;
		
					with(obj_message) {
						y-=50;
						if(y < 1000)
							instance_destroy()
					}
			}
	    break;
	    case 13: //tower
	        xp = buffer_read(buffer,buffer_u16)
			yp = buffer_read(buffer,buffer_u16)
			instance_create(xp,yp,obj_tower)
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
