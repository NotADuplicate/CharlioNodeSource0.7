function scr_jumper_receive() {
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
	        global.ammo = 0;
	        global.ready = 0;
	        obj_client.ready = false;
	        room_goto(9);
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
	        ins = instance_create(0,0,jumper_game);
	        ins.alarm[3] = 1;
	        ins.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
	        random_set_seed(buffer_read(buffer,buffer_u8));
	        global.ammodrop = (buffer_read(buffer,buffer_u8)/30);
	        global.ultdrop = buffer_read(buffer,buffer_u8)/30;
	        global.teaming = 3*buffer_read(buffer,buffer_u8);
	        global.cSwitch = buffer_read(buffer,buffer_bool);
	    break;
	    case 3://player positions and hp
	        num = buffer_read(buffer,buffer_u8);
	        xp = buffer_read(buffer,buffer_u16);
	        yp = buffer_read(buffer,buffer_u16);
	        scr_jumper_others(num,xp,yp);
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
	        scr_kill(dead,0);
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
	        ob = buffer_read(buffer,buffer_u8);
	        bullet = instance_create(xp,yp,ob);
	        bullet.num = buffer_read(buffer,buffer_u8);
	        if(ob == obj_grenade)
	            bullet.alarm[0] = buffer_read(buffer,buffer_u8)+1;
	        bullet.direction = dir;
	        bullet.image_angle = dir;
	        //bullet.speed = 20;
	    break;
	    case 8: //bolt aim
	        num = buffer_read(buffer,buffer_u8);
	        scr_bolt(num,buffer_read(buffer,buffer_u16))
	    break;
	    case 10:
			jumper_player.yspd = -23;
	    break;
	    case 11:
	        num = buffer_read(buffer,buffer_u8);
			if(room == num)
				room_goto_next();
	    break;
	    case 12:
			room_restart();
	        //global.players[num].jug = true;
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
			if(global.teaming != 0)
				global.teamNum[num] = buffer_read(buffer,buffer_s8);
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
		case 23:
			num = buffer_read(buffer,buffer_u8);
			if(num == obj_client.index) {
				obj_client.alarm[9] = 1;
				room_goto(0);
			}
		
	}



}
