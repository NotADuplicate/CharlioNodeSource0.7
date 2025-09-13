// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Molotov() constructor {
	sprite = spr_molotov;
	dps = 60;
	ammoCost = 2;
	duration = 6;
	cooldown = 15; 
	name = "Molotov"
	abilityName = "molotov"
	text = "Throw a molotov which creates a fire when it lands, dealing " + string(dps) + " damage per second and applying fire to anyone who stands in it (excludes allies but not you).";
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_molotov, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(2);
		return(cooldown)
	}
}