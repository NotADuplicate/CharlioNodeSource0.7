// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Milk() constructor {
	sprite = spr_milk;
	ammoCost = 3;
	cooldown = 15; 
	name = "Milk"
	abilityName = "milk"
	text = "Throw a jar of milk that cleanses any status effects."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_milk, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}