/// @description Take damage
	if(poison > 0)
		scr_dummy_damage(160,other.num,false);
	else
		scr_dummy_damage(80,other.num,false);	
    instance_destroy(other);
	motion_add(other.direction,18);