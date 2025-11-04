/// @description Take damage
	scr_dummy_damage(other.dmg,other.num,other.attack, other.icon, false);
	motion_add(other.direction,other.dmg/3);
	instance_destroy(other);