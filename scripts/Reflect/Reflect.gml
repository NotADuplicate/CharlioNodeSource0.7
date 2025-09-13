// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Reflect() constructor {
	sprite = spr_reflect;
	ammoCost = 2;
	cooldown = 7; 
	name = "Reflect"
	abilityName = "reflect"
	text = "Creates a reflect object directly in front of you which lasts 2 seconds and causes any projectile that hits it to go in the direction the reflect is pointing.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
		    dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
		    xp = ball_player.x + lengthdir_x(50,dir);
		    yp = ball_player.y + lengthdir_y(50,dir);
		    scr_ball_ammo(ammoCost);
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", xp, "Y", yp, "Obj", obj_reflect, "Dir", dir)
			return(cooldown)
		}
		else { return(0); }
	}
}