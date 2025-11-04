/// @description Handle AI inputs
switch(state) {
	case "Travel": //travel to defend tower
		if(point_distance(x,y,targetX,targetY) < 100) {
			state = "Travel Ball";
		}
		if(point_distance(x,y,ball_player.x,ball_player.y) < 450 && collision_line(x,y,ball_player.x,ball_player.y, ball_wall, false, false) == noone) {
			//if near player
			if(collision_line(x,y,ball_player.x,ball_player.y, obj_bigBall, false, false) != noone) {
				state = "Push";
			} else {
				state = "Skirmish";
			}
		}
		else if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 200 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			//if near ball
			state = "Push";
		}
	break;
	case "Travel Ball": //travel to the ball after respawn
		targetX = obj_bigBall.x;
		targetY = obj_bigBall.y;
		if(point_distance(x,y,ball_player.x,ball_player.y) < 450 && collision_line(x,y,ball_player.x,ball_player.y, ball_wall, false, false) == noone) {
			//if near player
			if(collision_line(x,y,ball_player.x,ball_player.y, obj_bigBall, false, false) != noone) {
				state = "Push";
			} else {
				state = "Skirmish";
			}
		}
		else if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 200 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			//if near ball
			state = "Push";
		}
	break;
	case "Push":
		if(point_distance(x,y,ball_player.x,ball_player.y) < 250 && collision_line(x,y,ball_player.x,ball_player.y, ball_wall, false, false) == noone) {
			if(collision_line(x,y,ball_player.x,ball_player.y, ball_wall, false, false) == noone && random(1) > 0.95) {
				if(recentlySwithced == 0) {
					state = "Skirmish";
					recentlySwithced = 80;
				}
			}
		}
		
		if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			
		} else {
			state = "Travel Ball";
		}
	break;
	case "Skirmish":
		if(collision_line(x,y,ball_player.x,ball_player.y, ball_wall, false, false) == noone) {
			if(knownLocation < 80) {
				knownLocation+=4;
			}
			
			if(point_distance(x,y,ball_player.x, ball_player.y) < 250) {
				if(reload == 0 && knownLocation > 12) {
					dir = point_direction(x,y,ball_player.x,ball_player.y)
					var bullet = instance_create(x+lengthdir_x(16,dir), y+lengthdir_y(16,dir), obj_bullet);
					bullet.direction = dir;
					bullet.num = 2;
					bullet.dmg = 20;
					bullet.icon = spr_pistol;
					reload = 24;
				}
			
				if(frostCooldown == 0 && random(1) > 0.98) {
					dir = point_direction(x,y,ball_player.x,ball_player.y)
					var bullet = instance_create(x+lengthdir_x(16,dir), y+lengthdir_y(16,dir), obj_frost);
					bullet.direction = dir;
					bullet.num = 2;
					frostCooldown = 450;
				}
			}
		} else {
			if(knownLocation > 0) {
				knownLocation--;
			} else {
				state = "Travel Ball";
			}
		}
		if(random(1) > 0.99 && point_distance(x,y,obj_bigBall.x, obj_bigBall.y) < 500) {
			if(recentlySwithced == 0) {
				state = "Push";
				recentlySwithced = 80;
			}
		}
		
		//Stop chasing under tower
		tower = instance_nearest(x,y,obj_turret);
		if(point_distance(ball_player.x,ball_player.y,tower.x,tower.y) < 150) { 
			state = "Push";
		}
	break;
	case "Dodge Fire": //continues until fire is gone
		if(instance_exists(obj_fire) && point_distance(x,y,obj_fire.x,obj_fire.y) < 350) {			
			if(point_distance(obj_bigBall.x,obj_bigBall.y, obj_fire.x, obj_fire.y) > 400) {
				state = "Push";
			} else if(point_distance(ball_player.x,ball_player.y, obj_fire.x, obj_fire.y) > 400) {
				state = "Skirmish";
			}
		} else {
			state = "Travel Ball";
		}
	break;
}

//Get pushed
if(frost > 0) {
	speed = 0;
}
if(speed > 0.5) {
	path_end();
}

if(hp < 150 && healCooldown == 0) {
	healBomb = instance_create(x,y,obj_healBomb);
	healBomb.num = num;
	healBomb.direction = global.throwing;
	healCooldown = 500;
} else if(blastOffCooldown == 0 && hp < 70 && point_distance(x,y,ball_player.x,ball_player.y) < 120) { //flee
	if(healCooldown < 450) { //dont blast off rt after using healBomb, its still in the air
		dir = point_direction(ball_player.x, ball_player.y, x,y);
		xp = x + lengthdir_x(90, dir);
		yp = y + lengthdir_y(90, dir);
		if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) { //if no walls behind them, blast off
			blastOffDir = dir-180;
			alarm[4] = 1;
			blastOffCooldown = 600;
		}
	}
}

if(blastOffCooldown == 0 && point_distance(x,y,ball_player.x,ball_player.y) < 60) {
	dir = point_direction(ball_player.x, ball_player.y, x,y);
	alarm[4] = 1;
	blastOffCooldown = 600;
}

if(reload > 0) {reload--;}
if(recentlySwithced > 0) {recentlySwithced--;}
if(frostCooldown > 0) {frostCooldown--;}
if(healCooldown > 0) {healCooldown--;}
if(blastOffCooldown > 0) {blastOffCooldown--;}