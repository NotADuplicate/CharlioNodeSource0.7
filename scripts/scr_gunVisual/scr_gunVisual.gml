// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gunVisual(gunName,gunObj){
	show_debug_message(gunName);
	switch(gunName) {
		case "Rifle":
			gunObj.sprite_index = spr_rifle;
			gunObj.scale = 1.5;
		break;
		case "Boomerang":
			gunObj.sprite_index = spr_boomerange;
			gunObj.scale = 0.8;
		break;
		case "Charge Pistol":
			gunObj.sprite_index = spr_chargeGun;
			gunObj.scale = 1;
		break;
		case "Curve Gun":
			gunObj.sprite_index = spr_curveGun;
			gunObj.scale = 1.5;
		break;
		case "Grenade Launcher":
			gunObj.sprite_index = spr_gLauncher;
			gunObj.scale = 1.5;
		break;
		case "Minigun":
			gunObj.sprite_index = spr_minigun;
			gunObj.scale = 1.5;
		break;
		case "Pistol":
			gunObj.sprite_index = spr_pistol;
			gunObj.scale = .8;
		break;
		case "Pop Gun":
			gunObj.sprite_index = spr_popGun;
			gunObj.scale = 1.25;
		break;
		case "Shotgun":
			gunObj.sprite_index = spr_shotgun;
			gunObj.scale = 1.5;
		break;
		case "Melee":
			gunObj.sprite_index = spr_melee;
			gunObj.scale = 1;
		break;
		case "Void Gun":
			gunObj.sprite_index = spr_biggun;
			gunObj.scale = 1;
		break;
	}
}