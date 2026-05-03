// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Malpractice() constructor {
	sprite = spr_malpractice;
	ammoCost = 3;
	duration = 6;
	cooldown = 220; 
	name = "Malpractice"
	abilityName = "malpractice"
	text = "Any healing to other players reduces this ability's cooldown. Shoot a cone of projectiles that bleed enemies for 5 seconds."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			global.stun = 110;
			global.slow = 1/2;
	        ball_game.alarm[7] = 110;
			ball_game.malpractice = 110;
			return(cooldown);
		}
		return(0);
	}
	
	static abilityReleased = function(buffer) {
	}
}