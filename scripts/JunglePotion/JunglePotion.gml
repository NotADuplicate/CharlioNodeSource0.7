// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function JunglePotion() constructor {
	sprite = spr_junglePot;
	duration = 15;
	ammoCost = 5;
	cooldown = 60; 
	name = "Jungle Potion"
	abilityName = "junglePotion"
	text = "Throw a potion which gives nearby allies all jungle buffs for " + string(duration) + " seconds.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_jungle_potion, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}