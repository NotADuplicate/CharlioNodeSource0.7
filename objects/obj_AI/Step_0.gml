/// @description Die and have friction
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
	/*if(burn mod 5 == 0) {
		if(oil > 0)
			scr_dummy_damage(4,enemy.num,false, spr_anger, true);
		else
			scr_dummy_damage(1,enemy.num,false, spr_anger, true);
		instance_create(x+random_range(-16,16),y+random_range(-16,16),obj_firePart)
	}*/
}
if(bleed > 0) { bleed--; }
if(frost > 0) { frost--; }
if(burstMoving > 0) { burstMoving--; }

if(loadoutUnseen) { //enemy team doesnt know what your loadout is till they see you
	with(ball_other) {
		if(global.teamNum[num] != global.teamNum[other.num] && collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
			if(instance_position(ball_player.x,ball_player.y,obj_cover) == noone) {
				other.loadoutUnseen = false
			}
		}	
	}
	with(ball_player) {
		if(global.teamNum[num] != global.teamNum[other.num] && collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
			if(instance_position(ball_player.x,ball_player.y,obj_cover) == noone) {
				other.loadoutUnseen = false
			}
		}	
	}
	if(loadoutUnseen == false) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",other.num,"Status Num",31)
		}
	}
}

dt = delta_time / 30000;
if(ability1CD > 0 || ammo < ability1.ammoCost) {ability1CD -= dt / room_speed; } else { ability1CD = ability1.aiConsider(self); }
if(ability2CD > 0 || ammo < ability2.ammoCost) {ability2CD -= dt / room_speed; } else { ability2CD = ability2.aiConsider(self); }
if(ability3CD > 0 || ammo < ability3.ammoCost) {ability3CD -= dt / room_speed; } else { ability3CD = ability3.aiConsider(self); }