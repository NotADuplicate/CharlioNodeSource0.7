// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Whirlwind() constructor {
	sprite = SD_machete;
	damage = 60;
	ammoCost = 2;
	cooldown = 8; 
	name = "Whirlwind"
	abilityName = "fireAxe"
	text = "Move a short distance towards your mouse and swing a sword all around you. The sword deals " + string(damage) + " and pulls players slightly towards you";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_whirlwind)
	        scr_ball_ammo(ammoCost);
			with(ball_player) {
				motion_set(point_direction(x,y,mouse_x,mouse_y),17)
				whirlwind = true;
			}
			global.stun = 15;
			return(cooldown);
		}
		else { return(0); }
	}
}