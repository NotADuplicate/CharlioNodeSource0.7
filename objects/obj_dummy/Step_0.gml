/// @description Die and have friction
if(hp < 1) {
	maxhp = 250;
	hp = maxhp;
	x = xp;
	y = yp;
	speed = 0;
	poisonDmg = 0;
	slayed = instance_create(0,0,slayer_marker)
	slayed.victim = "Dummy";
	slayed.killer = ball_player.num
	scr_cleanse(false);
}

	if(place_meeting(x+hspeed,y,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			x -= hspeed;
		}
	    hspeed = 0;
	}
	if(place_meeting(x,y+vspeed,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			y -= vspeed;
		}
	    vspeed = 0;
	}

if(speed > 0) {
	speed -= 1.2
	if(speed < 0.2)
		speed = 0;
}
if(invincibility > 0)
	invincibility--;
	
	
if(burn > 0) {
	burn--;
	if(burn mod 5 == 0) {
		if(oil > 0)
			scr_dummy_damage(4,ball_player.num,false);
		else
			scr_dummy_damage(1,ball_player.num,false);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}