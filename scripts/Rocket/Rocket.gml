// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Rocket() constructor {
	sprite = spr_rocket;
	damage = 40;
	ammoCost = 2;
	cooldown = 20; 
	name = "Rocket"
	abilityName = "rocket"
	text = "Shoot a rocket which deals 40 damage on impact and explodes. If you are hit by the explosion then your cooldown is reset"
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
			xp = ball_player.x+lengthdir_x(16,dir);
			yp = ball_player.y+lengthdir_y(16,dir);
			scr_ball_ammo(ammoCost)
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp, "Y", yp, "Obj", obj_rocket, "Dir", dir)
			return(cooldown);
		}
		else { return(0); }
	}
}