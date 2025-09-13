// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlareGun() constructor {
	sprite = spr_flare;
	damage = 30;
	duration = 8;
	ammoCost = 2;
	cooldown = 15; 
	name = "Flare Gun"
	abilityName = "flareGun"
	text = "Fires a fast moving flare which goes over walls and gives vision. Hitting enemies deals " + string(damage) + " damage and applies 8 seconds of buring.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_flare)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}