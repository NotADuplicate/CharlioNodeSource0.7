// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Deathtouch() constructor {
	sprite = spr_deathball;
	ammoCost = 4;
	cooldown = 15; 
	name = "Death Touch"
	abilityName = "deathTouch"
	text = "Shoots a projectile which applies death touch for 5 seconds. Any player who touches something afflicted with death touch instantly dies.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_deathTouch)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}