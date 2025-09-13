// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Shatter() constructor {
	sprite = spr_shatter;
	damage = 70;
	ammoCost = 1;
	cooldown = 18; 
	name = "Shatter"
	abilityName = "shatter"
	text = "Fire a fast moving projectile which passes through players but explodes upon contact with the ball or a wall. Explosions deal " + string(damage) + " to nearby enemies."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_shatter);
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}