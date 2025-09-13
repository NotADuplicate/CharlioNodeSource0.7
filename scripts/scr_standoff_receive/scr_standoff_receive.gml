function scr_standoff_receive() {
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
	        room_goto(standoff_room);
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
	        ins = instance_create(0,0,standoff_game);
	        ins.alarm[3] = 1;
	        ins.loop = buffer_read(buffer,buffer_u8);
	        obj_client.index = buffer_read(buffer,buffer_u8);
	        random_set_seed(buffer_read(buffer,buffer_u8));
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
	    case 5: //death
	        dead = buffer_read(buffer,buffer_u8);
	        scr_standoff_kill(dead);
			var band = buffer_read(buffer,buffer_bool)
			if(band == false && instance_exists(standoff_player)) {
				var killer = buffer_read(buffer,buffer_u8)
				if(killer == obj_client.index && global.bandit == false) {
					standoff_player.alarm[1] = 1;
				}
			}
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
	        ob = standoff_bullet;
	        bullet = instance_create(xp,yp,ob);
			instance_create(xp,yp,obj_noise);
	        bullet.num = buffer_read(buffer,buffer_u8);
	        bullet.direction = dir;
	        bullet.image_angle = dir;
	        //bullet.speed = 20;
	    break;
	    case 8: //win game
	        var winners = buffer_read(buffer,buffer_bool);
			ins = instance_create(0,0,standoff_win);
			ins.winners = winners;
	    break;
	    case 10:
	        num = buffer_read(buffer,buffer_u8);
	        ob = instance_create(0,0,obj_click);
	        ob.num = num;
	    break;
	    case 11:
	        num = buffer_read(buffer,buffer_u8);
	        ob = instance_create(0,0,obj_win);
	        ob.num = num;
	    break;
	    case 12:
	        num = buffer_read(buffer,buffer_u8);
			scr_jug(num);
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
