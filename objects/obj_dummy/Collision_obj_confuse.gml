/// @descriptio Damage and become confused
	scr_dummy_damage(20,other.num,false)
	instance_destroy(other);
	confused = 90;