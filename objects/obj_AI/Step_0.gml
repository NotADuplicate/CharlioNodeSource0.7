/// @description Die and have friction
if(hp < 1) {
	maxhp = 250;
	hp = maxhp;
	path_end();
	soul = instance_create(x,y,ball_corpse);
	soul.num = num;
	x = 0;
	y = 0;
	state = "Dead";
	speed = 0;
	poisonDmg = 0;
	slayed = instance_create(0,0,slayer_marker)
	slayed.victim = "Enemy";
	slayed.icon = recentDamageIcon;
	slayed.killer = ball_player.num
	alarm[3] = 300; //respawn
	
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
			scr_dummy_damage(4,ball_player.num,false, spr_anger, true);
		else
			scr_dummy_damage(1,ball_player.num,false, spr_anger, true);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}