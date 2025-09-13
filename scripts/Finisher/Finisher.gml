// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Finisher() constructor {
	sprite = spr_grave;
	ammoCost = 1;
	cooldown = 8; 
	name = "Finisher"
	abilityName = "finisher"
	text = "Shoot a fast moving projectile which goes through walls and kills targets who are below 35% health."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_finisher)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}