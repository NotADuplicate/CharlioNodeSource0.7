/// @description Update pathfinding target
if(state == "Push") {
	//check how far should be away from ball if ball under tower
	tower = instance_nearest(x,y,obj_turret);
	if(point_distance(obj_bigBall.x,obj_bigBall.y,tower.x,tower.y) < 150) {
		pushPos = scr_pushBallPath(6000,1500,190);
	} else {
		pushPos = scr_pushBallPath(6000,1500,80);
	}
	if(collision_line(pushPos.x, pushPos.y, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) {
		show_debug_message("Walk through ball");
		//if you need to get behind a wall to push ball, just walk into it to jostle it
		targetX = obj_bigBall.x + (pushPos.x-obj_bigBall.x) /3;
		targetY = obj_bigBall.y + (pushPos.y-obj_bigBall.y) /3;
	}
	else if(collision_line(pushPos.x, pushPos.y, x, y, obj_bigBall, false, false) != noone) { 
		//dont walk into the ball and push it wrong way
		show_debug_message("Walk around ball");
		dir = point_direction(obj_bigBall.x,obj_bigBall.y,x,y) + 90;
		pos1Valid = true;
		pos2Valid = true;
		newX = lengthdir_x(100,dir) + obj_bigBall.x;
		newY = lengthdir_y(100,dir) + obj_bigBall.y;
		newX2 = -lengthdir_x(100,dir) + obj_bigBall.x;
		newY2 = -lengthdir_y(100,dir) + obj_bigBall.y;
		
		//Check which spot is better to go to
		if(collision_line(newX, newY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) { pos1Valid = false; }
		if(collision_line(newX2, newY2, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) { pos2Valid = false; }
		
		if(pos1Valid && pos2Valid) { //pick the closer one to where to be
			if(point_distance(newX, newY, pushPos.x, pushPos.y) < point_distance(newX2, newY2, pushPos.x, pushPos.y)) {
				targetX = newX;
				targetY = newY;
			} else {
				targetX = newX2;
				targetY = newY2;
			}
		}
	}
	else {
		show_debug_message("Walk up to push pos");
		targetX = pushPos.x;
		targetY = pushPos.y;
		if(reload == 0 && point_distance(x,y, targetX, targetY) < 80) {
			show_debug_message("Shoot");
			dir = point_direction(x,y,obj_bigBall.x,obj_bigBall.y)
			var bullet = instance_create(x+lengthdir_x(16,dir), y+lengthdir_y(16,dir), obj_bullet);
			bullet.direction = dir;
			bullet.num = 2;
			bullet.icon = spr_pistol;
			reload = 30;
		}
	}
} else if(state == "Skirmish") {
	if(global.dead) {
		state = "Push";
	}
	var dist = 120;
	if(hp > 150 && blastOffCooldown == 0) { dist = 30; } //get close to blast off
	dir = point_direction(ball_player.x, ball_player.y, x, y);
	targetX = ball_player.x + lengthdir_x(dist, dir);
	targetY = ball_player.y + lengthdir_y(dist, dir);
	if(random(1) > 0.5) {
		dir = dir + random_range(-90,90);
		xp = ball_player.x + lengthdir_x(dist, dir);
		yp = ball_player.y + lengthdir_y(dist, dir);
		if(collision_line(ball_player.x,ball_player.y,xp, yp, ball_wall, false, false) == noone) {
			targetX = xp;
			targetY = yp;
		}
	}
	
	//blast off after player
	if(hp > 70 && (ball_player.hp < 50 || (ball_player.hp < 100 && ball_player.frost > 30)) && blastOffCooldown == 0) {
		if(point_distance(x,y,ball_player.x, ball_player.y) > 240) {
			if(collision_line(ball_player.x,ball_player.y,xp, yp, ball_wall, false, false) == noone) {
				dir = point_direction(ball_player.x, ball_player.y, x, y);
				var bo = instance_create(x,y,obj_rocketBlast);
				bo.direction = dir;
				bo.num = num;
				path_end();
				motion_add(dir+180, 30);
				blastOffCooldown = 600;
			}
		}
	}
}

//Escape molotov
if(state == "Dodge Fire") {
	dir = point_direction(obj_fire.x, obj_fire.y, x, y);
	xp = obj_fire.x+lengthdir_x(200, dir);
	yp = obj_fire.y+lengthdir_y(200, dir);
	if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
		targetX = xp;
		targetY = yp;
	} else {
		dir += 90;
		xp = obj_fire.x+lengthdir_x(200, dir);
		yp = obj_fire.y+lengthdir_y(200, dir);
		if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
			targetX = xp;
			targetY = yp;
		}
		else {
			dir -= 180;
			xp = obj_fire.x+lengthdir_x(200, dir);
			yp = obj_fire.y+lengthdir_y(200, dir);
			if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
				targetX = xp;
				targetY = yp;
			}
		}
	}
	if(collision_point(x,y,obj_fire,false,false) && blastOffCooldown == 0) { //blast off away from fire
		blastOffDir = point_direction(x,y,targetX,targetY)+180;
		alarm[4] = 1;
		blastOffCooldown = 600;
	}
}

if(state == "Travel") { //go to defend nearest friendly tower
	priority = 0;
	with(obj_turret) {
		if(num == 13) {
			other.targetX = x;
			other.targetY = y;
			other.priority = 3;
		} else if(num == 11 && other.priority < 2) {
			other.targetX = x;
			other.targetY = y;
			other.priority = 2;
		} else if(num == 15 && other.priority == 0) {
			other.targetX = x;
			other.targetY = y;
			other.priority = 1;
		}
	}
}

spd = 5;
if(frost > 0) { spd = 2;}
if(bleed == 0 && state != "Dead" && speed < 0.5) {
	scr_pathfind(targetX, targetY, spd);
}
alarm[2] = 10;

hp += 1;
if(hp > maxhp) {hp = maxhp;}