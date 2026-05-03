// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Protect() constructor {
	sprite = spr_sponge;
	ammoCost = 2;
	cooldown = 21; 
	name = "Protect"
	abilityName = "protect"
	text = "For the next 6 seconds, any damage dealt to allies near you is split evenly between you and the ally."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
	        scr_ball_ammo(ammoCost);
			scr_ability_shoot(obj_sponge);
			return(cooldown);	
		} 
		else { return(0); }
	}
}