/// @descriptio Damage and become confused
	scr_dummy_damage(20,other.num,false, spr_confuse, false)
	instance_destroy(other);
	confused = 90;