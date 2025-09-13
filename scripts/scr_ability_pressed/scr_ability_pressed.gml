// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_pressed(type){
	using = true;
	with(ball_player) {
		if(place_meeting(x,y,inst_utility)) {
			ins = instance_nearest(x,y,inst_utility);
			if(point_distance(x,y,ins.x,ins.y) < 20) {
			ins.ability = type;
			ins.alarm[2] = 1;
			other.using = false;
			}
		}
	}
	if(using && variable_global_get(type) != 0) {
	if(variable_global_get(type) == Abilities.hook) {
		held = true
		range = 0;
	}
	if(variable_global_get(type) == Abilities.curse && ball_player.curseCharge > 0) 
		global.stun = 0;
	if(obj_bigBall.drone == ball_player.num && variable_global_get(type) == "Drone") {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",48)
		}
	}
	if(global.ammo > 0 && instance_exists(ball_player) && variable_global_get(type + "Cool") == 0 && global.stun == 0 && global.shop == false && global.dead == false && global.throwRange == 0 && !global.upgraded) {
		var cool = 1;
		class = variable_global_get(type);
		show_debug_message(class)
		cool = class.abilityPressed(buffer);
	    switch("") {
			case "Quick Tap":
				if(global.attack = obj_minigun || global.attack = obj_ARbullet)
					cool = 10;
				else
					cool = 5;
				scr_ball_ammo(1);
				ball_game.reload = 0;
				ball_game.bullets = 5;
				ball_game.revving = 0;	
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 37)
			break;
			case "Holster":
				cool = 1;
				scr_ball_ammo(1);
				var switching = global.holster
				global.holster = global.attack
				global.attack = switching;
				with(ball_game) {
					node_send(buffer,"eventName","Extra Shit 2","Gun Name",global.holsterText, "Gun Num", ball_player.num);
				}
				switching = global.holsterText;
				global.holsterText = global.atktext;
				global.atktext = switching;
			break;
	        case "Gas Trap":
				if(global.caustic = 0) { //place the trap
					cool = 2;
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",ball_player.x,"Y",ball_player.y,"Obj",obj_caustic,"Dir",0)
				}
				else { //trigger the trap
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",ball_player.x,"Y",ball_player.y,"Obj",obj_causticTrigger,"Dir",0)
					cool = 9;
					global.caustic = 0;
				}
	            scr_ball_ammo(1);
	        break;
	        case "heal":
	            if(global.ammo > 2) {
					scr_ball_ammo(3)
					scr_ability_shoot(obj_healthShot);				
					cool = 4;
				}
	        break;
	        case "Blood Shot":
					scr_ball_ammo(1)
					scr_ability_shoot(obj_bloodShot);
					cool = 4;
					scr_damage(50,ball_player.num,false)
	        break;
	        case "Rocket":
					dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
					xp = ball_player.x+lengthdir_x(16,dir);
					yp = ball_player.y+lengthdir_y(16,dir);
					scr_ball_ammo(2)
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp, "Y", yp, "Obj", obj_rocket, "Dir", dir)
					cool = 14;
	        break;
	        case "Bump":
				scr_ball_ammo(1)
				scr_ability_shoot(obj_bump);	
				cool = 8;
	        break;
	        case "Armor Break":
	            if(global.ammo > 1) {
					scr_ball_ammo(2)
					scr_ability_shoot(obj_spear);
					cool = 13;
				}
	        break;
	        case "Frost Shot":
	            if(global.ammo > 1) {
					scr_ball_ammo(2)
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_frost, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))	
					cool = 15;
				}
	        break;
	        case "Ammo Shot":
	            if(global.ammo > 3) {
					scr_ball_ammo(4)
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_ammoShot, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))	
					cool = 1;
				}
	        break;
	        case "dash": 
				if(ball_player.frost == 0) {
	                global.slow = 3;
	                alarm[7] = 10;
					cool = 3;
					ball_player.dashing = 10;
	                scr_ball_ammo(1);
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 50)
				}
	        break;
	        case "push":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900) {
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_push, "Dir", 0)
		            scr_ball_ammo(1);
					cool = 5;
				}
	        break;
	        case "Gravity Well":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900) {
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_gravity, "Dir", 0)
		            scr_ball_ammo(1);
					cool = 15;
				}
	        break;
	        case "wall":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900) {
					dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_barrier, "Dir", dir)
		            scr_ball_ammo(1);
					cool = 14;
				}
	        break;
	        case "airstrike":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900) {
					range = 0;
		            if(global.ammo > 3) {
		                instance_create(mouse_x,mouse_y,player_airstrike);
						held = true
		            }
				}
	        break;
	        case "reflect":
				if(global.ammo > 1) {
		            dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
		            xp = ball_player.x + lengthdir_x(50,dir);
		            yp = ball_player.y + lengthdir_y(50,dir);
		            scr_ball_ammo(2);
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", xp, "Y", yp, "Obj", obj_reflect, "Dir", dir)
					cool = 7;
				}
	        break;
			case "Chainbreaker":
				held = true;
				range = 250;
			break;
			case "Hook":
	
				scr_ball_ammo(2);
				//buffer_seek(buffer, buffer_seek_start, 0);
				cool = 16;
	            //buffer_write(buffer, buffer_u8, 7); //bullet
	            dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
	            xp = x;
	            yp = y;
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", xp, "Y", yp, "Obj", obj_hook, "Dir", dir)
				held = true
			break;
			case "Drone":
				scr_ball_ammo(1);
				//buffer_seek(buffer, buffer_seek_start, 0);
				cool = 22;
	           // buffer_write(buffer, buffer_u8, 7); //bullet
	            dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
	            xp = ball_player.x;
	            yp = ball_player.y;
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", xp, "Y", yp, "Obj", obj_drone, "Dir", dir)
			break;
			case "Stasis":
				held = true;
				range = 150;
			break;
			case "Enrage":
				held = true;
				range = 200;
			break;
			case "flash":
				held = true;
				range = 200;
			break;
			case "Leap":
				held = true;
				range = 300;
			break;
			case "Decay":
				held = true;
				range = 200;
			break;
			case "teleport":
				if(global.ammo > 4 && ball_game.started) {
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_teleport, "Dir", 0)
					scr_ball_ammo(4);
					cool = 70;
				}
			break;
			case "finisher":
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_finisher, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
	            scr_ball_ammo(1);
				cool = 10;
			break;
			case "molotov":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_molotov,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 15;
				}
			break;
			case "Wind Bomb":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_windBomb,"eventName","Bullet")
		            scr_ball_ammo(1);
					cool = 15;
				}
			break;
			case "Fertilizer":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_fertilizer,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 15;
				}
			break;
			case "Cross Zone":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_crossThrown,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 20;
				}
			break;
			case "Caltrops":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_thrownCaltrops,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 20;
				}
			break;
			case "Flashbang":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_flashbang,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 30;
				}
			break;
			case "Warp Points":
				node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_warp,"eventName","Bullet")
	            scr_ball_ammo(1);
				cool = 30;
			break;
			case "Healing Point":
				if(global.ammo > 2) {
					node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_healPoint,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 30;
				}
			break;
			case "cleaver":
				if(global.ammo > 2) {
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_cleaver, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
		            scr_ball_ammo(3);
					cool = 15
				}
			break;
			case "Curse":
				if(ball_player.curseCharge > 0) {
							ball_player.curseCharge = 0
							node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"User",ball_player.curseCharge,"Status Num",27)
							cool = 15;
				}
				else if(global.ammo > 1) {
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_curse, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
		            scr_ball_ammo(2);
					cool = 15;
				}
			break;
			case "Confuse":
				if(global.ammo > 1) {
					node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj_confuse, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
		            scr_ball_ammo(2);
					cool = 22
				}
			break;
			case "Poison Dagger":
				if(global.ammo > 1) {
					
		            scr_ball_ammo(2);
					cool = 8;
				}
			break;
			case "Shuriken":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_shuriken,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 10;
				}
			break;
			case "Death Touch":
				if(global.ammo > 3) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_deathTouch,"eventName","Bullet")
		            scr_ball_ammo(4);
					cool = 15;
				}
			break;
			case "Block":
				if(global.ammo > 1) {
					if(ball_player.spellShield == 0) {
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 8)
						global.invincibility = 20
					}
		            scr_ball_ammo(2);
					cool = 8;
				}
			break;
			case "Rest":
				if(global.ammo > 0) {
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 45)
					node_send(buffer,"eventName","Bullet","X",ball_player.x,"Y",ball_player.y,"Dir",0,"Num",ball_player.num,"Obj",obj_sleep)
		            scr_ball_ammo(1);
					cool = 18;
				}
			break;
			case "Ghost":
				ball_player.ghosting = 60;
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 43)
		            scr_ball_ammo(2);
					cool = 25;
			break;
			case "Spell Shield":
		            xp = mouse_x;
		            yp = mouse_y;
					if(keyboard_check(vk_control)) {
						xp = ball_player.x;
						yp = ball_player.y;
					}
				if(global.ammo > 2) {
					node_send(buffer,"Dir",0,"X",xp,"Y",yp,"Num",ball_player.num,"Obj",obj_spellShield,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 20;
				}
			break;
			case "Shield":
		            xp = mouse_x;
		            yp = mouse_y;
					if(keyboard_check(vk_control)) {
						xp = ball_player.x;
						yp = ball_player.y;
					}
				if(global.ammo > 2 && scr_ball_dist(mouse_x,mouse_y,false) < 60) {
					instance_create(xp,yp,obj_shield);
		            scr_ball_ammo(3);
					cool = 20;
				}
			break;
			case "Ability Shield":
				if(global.ammo > 2 && scr_ball_dist(mouse_x,mouse_y,false) < 60) {
					ins = instance_create(mouse_x,mouse_y,obj_shield);
					ins.ability = true;
		            scr_ball_ammo(3);
					cool = 20;
				}
			break;
			case "Ninja Slash":
				if(global.ammo > 2) {
					ball_player.ninja = 1;
					held = true;
				}
			break;
			case "Blast Off":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_rocketBlast,"eventName","Bullet")
		            scr_ball_ammo(2);
					scr_player_move(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)+180,23)
					cool = 15;
				}
			break;
			case "Oil Can":
				//if(global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_oilCan,"eventName","Bullet")
		            scr_ball_ammo(1);
					cool = 15;
				//}
			break;
			case "Chum":
				//if(global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_chum,"eventName","Bullet")
		            scr_ball_ammo(1);
					cool = 30;
				//}
			break;
			case "Milk":
				//if(global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_milk,"eventName","Bullet")
		            scr_ball_ammo(1);
					cool = 15;
				//}
			break;
			case "Flare Gun":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_flare,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 15;
				}
			break;
			case "Fire Axe":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_axetinguisher,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 7;
				}
			break;
			case "Machete":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_machete,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 8;
				}
			break;
			case "Bat":
				if(global.ammo > 1) {
					ball_player.batCharge = 1;
					global.slow = 0;
					held = true;
					scr_ball_ammo(1);
				}
			break;
			case "Shield Bash":
				if(global.ammo > 2) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_shieldBash,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 18;
				}
			break;
			case "Cryofreeze":
				held = true;
				range = 200;
			break;
			case "Implosion Grenade":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_imploder,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 22;
				}
			break;
			case "Inverter":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_inverter,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 12;
				}
			break;
			case "Duel Bomb":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 1) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_duel,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 42;
				}
			break;
			case "Health Bomb":
				if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo > 2) {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_healBomb,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 18;
				}
			break;
			case "Swapper":
				if(global.ammo > 2) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_swap,"eventName","Bullet")
		            scr_ball_ammo(3);
					cool = 15
				}
			break;
			case "Sleep Dart":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_sleepDart,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 24
				}
			break;
			case "Toss":
				if(global.ammo > 1) {
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_glove,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 14
					held = true;
					range = 450;
				}
			break;
			case "Body Slam":
				if(global.ammo > 1) {
						node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"User",20,"Status Num",21)
						scr_ball_ammo(2);
						cool = 30;
						ball_player.bodySlam = true
				}
				
			break;
	        case "PokeBall":
				if(global.poke == false) {
					scr_ball_ammo(1)
					node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_pokeball,"eventName","Bullet")
				}
				else {
					node_send(buffer,"Dir",global.throwing,"X",mouse_x,"Y",mouse_y,"Num",ball_player.num,"Obj",obj_thrownPokeball,"eventName","Bullet")
					global.poke = false;
		            scr_ball_ammo(1);
					cool = 15;
				}
	        break;
			case "Mark":
				if(global.marked != 0) {
					global.markLocked = global.marked;
					node_send(buffer,"eventName","Targeted Status","Target",ball_player.num, "User", global.marked.num,"Status Num",29) 
					cool = 20;
				}
			break;
			case "Chomp":
				if(global.ammo > 1) {
					dist = 60 * ball_player.scale
					dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
		            xp = ball_player.x + lengthdir_x(dist,dir);
		            yp = ball_player.y + lengthdir_y(dist,dir);
					node_send(buffer,"Dir",(ball_player.maxhp-ball_player.hp),"X",xp,"Y",yp,"Num",ball_player.num,"Obj",obj_chomp,"eventName","Bullet")
		            scr_ball_ammo(2);
					cool = 15;
				}
			break;
	    }
		variable_global_set(type + "Cool",cool)
	}
	}
}