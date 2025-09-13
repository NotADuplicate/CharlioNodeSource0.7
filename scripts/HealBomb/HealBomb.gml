// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HealBomb() constructor {
	sprite = spr_healthBomb;
	damage = 30;
	healing = 50;
	ammoCost = 4;
	cooldown = 15; 
	name = "Heal Bomb"
	abilityName = "healBomb"
	text = "Throw a bomb which heals nearby allies by " + string(healing) + " health and damages enemies by " + string(damage) + " damage when it lands";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_healBomb, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}