/// @description Die and have friction
if(hp < 1) {
	maxhp = 250;
	hp = maxhp;
	path_end();
	soul = instance_create(x,y,ball_corpse);
	soul.num = num;
	x = -500;
	y = -500;
	state = "Dead";
	speed = 0;
	poisonDmg = 0;
	slayed = instance_create(0,0,slayer_marker)
	slayed.victim = "Enemy";
	slayed.icon = recentDamageIcon;
	slayed.killer = enemy.num
	alarm[3] = 300; //respawn
	
	scr_cleanse(false);
}

	if(place_meeting(x+hspeed,y,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			x -= hspeed*1.5;
		}
	    hspeed *= -0.2;
	}
	if(place_meeting(x,y+vspeed,ball_wall)) {
		if(place_meeting(x,y,ball_wall)) {
			y -= vspeed*1.5;
		}
	    vspeed *= -0.2;
	}
	if(place_meeting(x,y,ball_wall)) {
		var playerDir = point_direction(x,y,enemy.x,enemy.y);
		x += lengthdir_x(5,playerDir);
		y += lengthdir_y(5,playerDir);
	}

if(speed > 0) {
	speed -= 1.2
	if(speed < 0.2)
		speed = 0;
}
if(invincibility > 0)
	invincibility--;
if(pushingBall >0) {
	pushingBall--;
	if(pushingBall == 0) { path_speed *= 2; }
}
	
if(burn > 0) {
	burn--;
	if(burn mod 5 == 0) {
		if(oil > 0)
			scr_dummy_damage(4,enemy.num,false, spr_anger, true);
		else
			scr_dummy_damage(1,enemy.num,false, spr_anger, true);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}
}

dt = delta_time / 30000;
show_debug_message("Considering abilities for player")
show_debug_message(num)
if(ability1CD > 0 || ammo < ability1.ammoCost) {ability1CD -= dt / room_speed; } else { ability1CD = ability1.aiConsider(self); }
if(ability2CD > 0 || ammo < ability2.ammoCost) {ability2CD -= dt / room_speed; } else { ability2CD = ability2.aiConsider(self); }
if(ability3CD > 0 || ammo < ability3.ammoCost) {ability3CD -= dt / room_speed; } else { ability3CD = ability3.aiConsider(self); }