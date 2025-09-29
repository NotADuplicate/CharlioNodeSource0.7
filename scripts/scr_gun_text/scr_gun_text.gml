// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gun_text(gun){
	switch(gun) {
		case obj_void:
			return("Shoot long lasting, high damage, very slow moving projectiles. \n Void shots take .5 seconds to activate ")
		break
		case obj_ARbullet:
			return("Can fire as fast as you can click but you have a limited clip that is displayed above your character")
		break;
		case obj_melee:
			return("Short range, high damage. Ol' reliable")
		break;
		case obj_bullet:
			return("Very low damage but hitting enemies regenerates ammo")
		break;
		case obj_grenade:
			return("Fire a grenade when you release left click. \n The longer you held click the longer the grenade takes to explode ")
		break;
		case obj_minigun:
			return("Hold down click to rev up and then fire a stream of bullets. \nThe longer you shoot the more ammo it consumes ")
		break;
		case obj_boomerang:
			return("Does more damage on the way back. Takes a lot of ammo but catching it refunds the ammo.")
		break;
		case obj_curve:
			return("The bullets curve as indicated by barrel of the gun. \nAt the end of the bullets path it explodes for massive damage")
		break;
		case virgin_bullet:
		case chad_bullet:
			return("Very weak bullets but every 4th shot is extremely powerful")
		break
		case obj_shotgun:
			return("Slow firing and short range but deals huge damage up close. \nGood for pushing the ball and defending against attackers.")
		break;
		case other_bolt:
			return("Long range slow fire rate. Charge for longer to deal more damage ")
		break;
	}
}