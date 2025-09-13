// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Deathtouch() constructor {
	sprite = spr_deathball;
	ammoCost = 4;
	cooldown = 15; 
	name = "Death Touch"
	abilityName = "deathTouch"
	text = "Shoots a fast moving projectile which deals no damage but applies death touch for 5 seconds to any player or ball it hits. Any player who touches something afflicted with death touch instantly dies. While the ball is deathtouched, it deals double damage to towers.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_deathTouch)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}