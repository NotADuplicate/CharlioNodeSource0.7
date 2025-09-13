// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Frost() constructor {
	sprite = spr_frost;
	damage = 20;
	duration = 6;
	ammoCost = 2;
	cooldown = 19; 
	name = "Frost Shot"
	abilityName = "Frost Shot"
	text = string("Shoot a fast moving projectile which deals " + string(damage) + " damage and frosts a target for " + string(duration) + " seconds. While frosted, the target moves at half speed and does not take knockback from any sources.");
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_frost)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}