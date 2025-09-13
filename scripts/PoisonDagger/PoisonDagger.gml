// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PoisonDagger() constructor {
	sprite = spr_knife;
	damage = 20;
	duration = "12 seconds";
	ammoCost = 2;
	cooldown = 8; 
	name = "Poison Dagger"
	abilityName = "poisonDagger"
	text = "Fires a fast moving projectile which deals " + string(damage) + " damage and poisons a target for " + duration + " seconds. Poison damage stacks exponentially so being poisoned for 10 seconds deals 50 damage, but being poisoned for 20 seconds deals 180 damage"
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_knife)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}