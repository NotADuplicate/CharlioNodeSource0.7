/// @description Statuses
if(burn > 0) {
	burn--;
	frost = 0;
	if(burn mod 5 == 0) {
		if(oil > 0)
			scr_dummy_damage(3,ball_player.num,false);
		else
			scr_dummy_damage(1,ball_player.num,false);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}
if(magicBurn > 0) {
	magicBurn--;
	if(magicBurn mod 5 == 0) {
		if(oil > 0)
			scr_dummy_damage(3,ball_player.num,false);
		else
			scr_dummy_damage(1,ball_player.num,false);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_darkPart)
	}
}
if(drowsy > 0) {
	drowsy--;
	if(drowsy mod 10 == 0) {
		instance_create(x,y,obj_Z);
		if(drowsy == 0)
			sleeping = 150;
	}
}
if(sleeping > 0) {
	sleeping--;
	if(sleeping mod 8 == 0) {
		instance_create(x,y,obj_Z);
	}
}