/// @description Take damage
	scr_dummy_damage(other.dmg,other.num,other.attack);
	motion_add(other.direction,other.dmg/3);
	instance_destroy(other);