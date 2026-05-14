// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HealBomb() constructor {
	sprite = spr_healthBomb;
	healing = 50;
	ammoCost = 4;
	cooldown = 14; 
	name = "Heal Bomb"
	abilityName = "healBomb"
	text = "Throw a bomb which heals all players by " + string(healing) + " health when it lands";
	
	
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