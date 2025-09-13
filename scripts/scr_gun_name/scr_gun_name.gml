// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gun_name(gun){
	switch(gun) {
		case obj_void:
			return("Void Gun");
		break
		case obj_ARbullet:
			return("Pop Gun")
		break;
		case obj_melee:
			return("Melee")
		break;
		case obj_bullet:
			return("Pistol")
		break;
		case obj_grenade:
			return("Grenade Launcher")
		break;
		case obj_minigun:
			return("Minigun")
		break;
		case obj_boomerang:
			return("Boomerang")
		break;
		case obj_curve:
			return("Curve Gun")
		break;
		case virgin_bullet:
		case chad_bullet:
			return("Charge Pistol")
		break
		case obj_shotgun:
			return("Shotgun")
		break;
		case other_bolt:
			return("Rifle")
		break;
	}
}