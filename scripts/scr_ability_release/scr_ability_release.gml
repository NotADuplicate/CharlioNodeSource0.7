// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_release(type){
	var ab = variable_global_get(type)
	if(held || ab == "Hook" || ab == "Quill" || ab = "Bat" && global.dead == false) {
		var cool = 0;
		var class = variable_global_get(type);
		if variable_instance_exists(class, "abilityReleased") {
			cool = class.abilityReleased(buffer);
			variable_instance_set(ball_player, type + "CoolMax", cool)
		}
		switch("variable_global_get(type)") {
			case "Chainbreaker":
				if(scr_ball_dist(ball_player.x,ball_player.y,true) < 260 && global.ammo > 2) {
					node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_chain,"eventName","Bullet")
					scr_ball_ammo(3)
					cool = 7;
				}
			break;
			case "Bat":
					global.slow = 1;
					if(ball_player.batCharge > 0) {
						cool = 12;
						node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.batCharge,"Y",0,"Num",ball_player.num,"Obj",obj_bat,"eventName","Bullet")
						show_debug_message("Bat swing")
					}
					ball_player.batCharge = 0;
			break;
			case "Quill":
				/*if(instance_exists(obj_quill)) {
		            buffer_seek(buffer, buffer_seek_start, 0);
		            buffer_write(buffer, buffer_u8, 6); //stop hooking
		            buffer_write(buffer,buffer_u16,obj_quill);
		            buffer_write(buffer,buffer_u8,ball_player.num);
		            network_send_packet(socket, buffer, buffer_tell(buffer));
				}
				cool = variable_global_get(type + "Cool")*/
			case "Stasis":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 150 && scr_ball_dist(mouse_x,mouse_y,false) < 60 && global.ammo > 2) {
		            xp = mouse_x;
		            yp = mouse_y;
					if(keyboard_check(vk_control)) {
						xp = ball_player.x;
						yp = ball_player.y;
					}
					instance_create(xp,yp,obj_stasis)
					scr_ball_ammo(3)
		            /*buffer_write(buffer,buffer_u16,xp);
		            buffer_write(buffer,buffer_u16,yp);
		            buffer_write(buffer,buffer_u16,dir);
		            buffer_write(buffer,buffer_u16,obj_stasis);
		            buffer_write(buffer,buffer_u8,ball_player.num);
		            network_send_packet(socket, buffer, buffer_tell(buffer));*/
					cool = 30;
				}
			break;
			case "Decay":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 200 && scr_ball_dist(mouse_x,mouse_y,false) < 60 && global.ammo > 1) {
		            /*buffer_seek(buffer, buffer_seek_start, 0);
		            buffer_write(buffer, buffer_u8, 7); //bullet
		            dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)*/
		            xp = mouse_x;
		            yp = mouse_y;
					instance_create(xp,yp,obj_decay)
					scr_ball_ammo(2)
		            /*buffer_write(buffer,buffer_u16,xp);
		            buffer_write(buffer,buffer_u16,yp);
		            buffer_write(buffer,buffer_u16,dir);
		            buffer_write(buffer,buffer_u16,obj_stasis);
		            buffer_write(buffer,buffer_u8,ball_player.num);
		            network_send_packet(socket, buffer, buffer_tell(buffer));*/
					cool = 20;
				}
			break;
			case "Enrage":
				if(global.ammo > 3 && point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 200 && scr_ball_dist(mouse_x,mouse_y,false) < 60) {
		            /*buffer_seek(buffer, buffer_seek_start, 0);
		            buffer_write(buffer, buffer_u8, 7); //bullet
		            dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)*/
					scr_ball_ammo(4);
		            xp = mouse_x;
		            yp = mouse_y;
					if(keyboard_check(vk_control)) {
						xp = ball_player.x;
						yp = ball_player.y;
					}
					instance_create(xp,yp,obj_anger)
		            /*buffer_write(buffer,buffer_u16,xp);
		            buffer_write(buffer,buffer_u16,yp);
		            buffer_write(buffer,buffer_u16,dir);
		            buffer_write(buffer,buffer_u16,obj_stasis);
		            buffer_write(buffer,buffer_u8,ball_player.num);
		            network_send_packet(socket, buffer, buffer_tell(buffer));*/
					cool = 45;
				}
			break;
			case "Hook":
				if(instance_exists(obj_hook) && obj_hook.hooked != 0) {
					node_send(buffer,"eventName","Hook Stop","Obj",obj_hook,"Num",ball_player.num)
				}
				cool = variable_global_get(type + "Cool")
			break;
			case "airstrike":
				if(global.ammo > 3) {
					player_airstrike.alarm[0] = 1;
					scr_ball_ammo(4);
					cool = 8;
				}
				else
					instance_destroy(player_airstrike)
			break;
			case "flash":
			if(global.ammo > 0 && ball_game.started) {
				global.flashDir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y) + 180
						node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_sparker,"eventName","Bullet")
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 200) {
					ball_player.x = mouse_x;
					ball_player.y = mouse_y;
					
					cool = 18;
					scr_ball_ammo(2);
				}
				else {
					ball_player.x += lengthdir_x(200,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
					ball_player.y += lengthdir_y(200,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
					cool = 18;
					scr_ball_ammo(2);
				}
				with(ball_player) {
					while(place_meeting(x,y,ball_wall)) {
						x += lengthdir_x(5,global.flashDir);
						y += lengthdir_y(5,global.flashDir);
					}
				}
			}
			break;
			case "Leap":
			if(global.ammo > 0 && ball_game.started) {
				if(position_meeting(ball_player.x,ball_player.y,obj_cover)) {
					if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < range) {
						node_send(buffer,"eventName","Airborne","Num",ball_player.num,"X",ball_player.x+lengthdir_x(range,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)),"Y",ball_player.y+lengthdir_y(range,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)))
						cool = 8;
						scr_ball_ammo(1);
					}
					else {
						node_send(buffer,"eventName","Airborne","Num",ball_player.num,"X",mouse_x,"Y",mouse_y)
						cool = 8;
						scr_ball_ammo(1);
					}
				}
				else if(position_meeting(mouse_x,mouse_y,obj_cover)) {
					if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < range) {
						node_send(buffer,"eventName","Airborne","Num",ball_player.num,"X",mouse_x,"Y",mouse_y)
						cool = 8;
						scr_ball_ammo(1);
					}
				}
			}
			break;
			case "Ninja Slash":
				ball_player.ninjaSlash = true;
				ball_player.speed = 20;
				ball_player.direction = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
				global.slow = 0;
				cool = 18;
				scr_ball_ammo(3);
				node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.ninja,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_ninjaSlash,"eventName","Bullet")
			break;
			case "Cryofreeze":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 200 && global.ammo > 2 && scr_ball_dist(mouse_x,mouse_y,false) < 60) {
				    instance_create(mouse_x,mouse_y,obj_cryo);
					scr_ball_ammo(3);
					cool = 35;
				}
			break;
			case "Toss":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < range) {
					node_send(buffer,"eventName","Thrown","Num",ball_player.num,"X",mouse_x,"Y",mouse_y);//,"Spd",global.throwing)
				}
				else {
					xp = ball_player.x+lengthdir_x(range,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
					yp = ball_player.y+lengthdir_y(range,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
					node_send(buffer,"eventName","Thrown","Num",ball_player.num,"X",xp,"Y",yp)//,"Spd",global.throwing)
				}
				
			break;
		}
	if(cool != 0)
		variable_global_set(type + "Cool",cool)
		/*if(global.spellBlade) {
		            buffer_seek(buffer, buffer_seek_start, 0);
		            buffer_write(buffer, buffer_u8, 11); //bullet
		            buffer_write(buffer, buffer_u8, ball_player.num);
		            buffer_write(buffer, buffer_u8,39);
		            network_send_packet(socket, buffer, buffer_tell(buffer));
		}*/
	}
	held = false;
}