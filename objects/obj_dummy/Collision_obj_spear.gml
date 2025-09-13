/// @descriptio Damage and bleed
	scr_dummy_damage(40,other.num,false)
	instance_destroy(other);
	if(invincibility = 0) {
		broken = 180;
	}