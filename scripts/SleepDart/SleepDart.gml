// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SleepDart() constructor {
	sprite = spr_blowDart;
	damage = 20;
	ammoCost = 2;
	cooldown = 24; 
	duration = 5;
	name = "Sleep Dart"
	abilityName = "sleepDart"
	text = "Shoot a dart which applies drowsy to enemies. Enemies will be drowsy for 2 seconds before falling asleep for 5 seconds. Taking damage while asleep causes them to wake up";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_sleepDart)
		    scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}