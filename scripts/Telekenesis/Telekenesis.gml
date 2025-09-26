// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Telekenesis() constructor {
	sprite = spr_telekenesis;
	ammoCost = 2;
	cooldown = 21;
	duration = 5;
	name = "Telekenesis"
	abilityName = "telekenesis"
	text = "Shoot a ball that upon hitting a player applies telekenesis to them for 5 seconds. During this time they are moved towards wherever your cursor is";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_telekenesis);
			return(cooldown);
		}
		else { return(0); }
	}
}