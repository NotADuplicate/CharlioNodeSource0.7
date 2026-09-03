// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlasmaBomb() constructor {
	sprite = spr_plasmaBomb;
	dps = 12;
	damage = 70;
	ammoCost = 2;
	duration = 9;
	cooldown = 16; 
	name = "Plasma Bomb"
	abilityName = "plasmaBomb"
	text = "Throw a bomb which explodes in a small radius dealing " + string(damage) + " damage and applying plasma for " + string(duration) + " seconds.";
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_plasmaBomb, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		if(scr_endThrow(buffer)) {
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
	}
}