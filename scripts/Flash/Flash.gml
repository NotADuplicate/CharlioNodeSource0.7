// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Flash() constructor {
	sprite = spr_flash;
	ammoCost = 2;
	cooldown = 21; 
	name = "Flash"
	abilityName = "flash"
	text = "Instantly teleport a short distance. Can be used to jump over walls."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 200;
		}
		return(0);
	}
	
	static abilityReleased = function(buffer) {
		if(global.ammo > 0 && ball_game.started) {
			global.flashDir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y) + 180
					node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_sparker,"eventName","Bullet")
			if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 200) {
				ball_player.x = mouse_x;
				ball_player.y = mouse_y;
				scr_ball_ammo(ammoCost);
			}
			else {
				ball_player.x += lengthdir_x(200,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
				ball_player.y += lengthdir_y(200,point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
				scr_ball_ammo(ammoCost);
			}
			with(ball_player) {
				while(place_meeting(x,y,ball_wall)) {
					x += lengthdir_x(5,global.flashDir);
					y += lengthdir_y(5,global.flashDir);
				}
			}
			return(cooldown);
		}
		else { return(0); }
	}
}