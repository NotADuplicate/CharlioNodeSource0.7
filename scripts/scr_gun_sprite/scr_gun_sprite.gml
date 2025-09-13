// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gun_sprite(gun){
	switch(gun) {
		case obj_bullet:
			return(spr_pistol);
		break;
		case obj_grenade:
			return(spr_gLauncher);
		break;
		case obj_minigun:
			return(spr_minigun);
		break;
		case obj_shotgun:
			return(spr_shotgun);
		break;
		case other_bolt:
			return(spr_rifle);
		break;
		case obj_void:
			return(spr_biggun);
		break;
		case obj_ARbullet:
			return(spr_popGun);
		break;
		case obj_curve:
			return(spr_curveGun);
		break;
		case obj_boomerang:
			return(spr_boomerange);
		break;
		case virgin_bullet:
		case chad_bullet:
			return(spr_chargeGun);
		break;
		case obj_melee:
			return(spr_melee);
		break;
	}
}