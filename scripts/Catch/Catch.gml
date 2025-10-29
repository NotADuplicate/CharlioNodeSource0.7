// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Catch() constructor {
	sprite = spr_glove;
	ammoCost = 2;
	cooldown = 13; 
	name = "Catch"
	abilityName = "catch"
	text = "Use to catch an airborne object and throw it";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
		    dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
			xp = ball_player.x;
			yp = ball_player.y;
			xp += lengthdir_x(20,dir)
			yp += lengthdir_y(20,dir)
			ins = instance_create(xp,yp, obj_catch);
			ins.image_angle = dir;
			ins.num = ball_player.num;
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		return(cooldown)
	}
}