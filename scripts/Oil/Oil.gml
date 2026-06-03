// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Oil() constructor {
	sprite = spr_jerryCan;
	ammoCost = 2;
	duration = 8;
	cooldown = 21; 
	name = "Oil"
	abilityName = "oil"
	text = "Throw an oil can that covers enemies in oil for " + string(duration) + " seconds. Oiled players are slippery and take triple damage from plasma and burning."
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_oilCan, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}