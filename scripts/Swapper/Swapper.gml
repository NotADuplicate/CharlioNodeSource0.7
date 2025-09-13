// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Swapper() constructor {
	sprite = spr_swapper;
	ammoCost = 3;
	cooldown = 15; 
	name = "Swapper"
	abilityName = "swapper"
	text = "Fire a projectile that passes through walls which will cause you to swap places with any player it hits.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_swap)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}