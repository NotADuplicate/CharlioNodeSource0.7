// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Bump() constructor {
	sprite = spr_blast;
	ammoCost = 1;
	cooldown = 8; 
	name = "Bump"
	abilityName = "bump"
	text = "Apply knockback to nearby players and the ball towards your mouse."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_bump);
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}