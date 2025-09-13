// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Shuriken() constructor {
	sprite = spr_shuriken;
	damage = 50;
	ammoCost = 2;
	cooldown = 10; 
	name = "Shuriken"
	abilityName = "shuriken"
	text = "Shoot a shuriken which deals " + string(damage) + " damage. If you hit you refund the ammo and reset the cooldown to 1 second.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_shuriken,"eventName","Bullet")
		    scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else { return(0) }
	}
}