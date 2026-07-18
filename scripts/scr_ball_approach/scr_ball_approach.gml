function scr_ball_approach(){
if(collision_line(pushPos.x, pushPos.y, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) {
		show_debug_message("Walk through ball");
		pushDir = point_direction(obj_bigBall.x,obj_bigBall.y,pushPos.x,pushPos.y);
		i = 1;
		while(collision_line(pushPos.x, pushPos.y, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone && i < 10) {
			newX = obj_bigBall.x + lengthdir_x(30,pushDir - i * 10)
			newY = obj_bigBall.y + lengthdir_y(30,pushDir - i * 10)
			if(collision_line(newX, newY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) == noone) {
				pushPos.x = newX;
				pushPos.y = newY;
			} else {
				newX = obj_bigBall.x + lengthdir_x(30,pushDir + i * 10)
				newY = obj_bigBall.y + lengthdir_y(30,pushDir + i * 10)
				if(collision_line(newX, newY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) == noone) {
					pushPos.x = newX;
					pushPos.y = newY;
				}
			}
			i++;
		}
		
		//if you need to get behind a wall to push ball, just walk into it to jostle it
		targetX = obj_bigBall.x + (pushPos.x-obj_bigBall.x) /3;
		targetY = obj_bigBall.y + (pushPos.y-obj_bigBall.y) /3;
	}
	else if(collision_line(obj_bigBall.x + (pushPos.x-obj_bigBall.x)*4, obj_bigBall.y + (pushPos.y-obj_bigBall.y)*4, x, y, obj_bigBall, false, false) != noone) { 
		//dont walk into the ball and push it wrong way
		
		if(!walkingAround) {
			show_debug_message("Walk around ball");
			
			walkingAround = true;
			alarm[6] = 40; // reset walking around
			dir = point_direction(obj_bigBall.x,obj_bigBall.y,x,y) + 90;
			pos1Valid = true;
			pos2Valid = true;
			newX = lengthdir_x(100,dir) + obj_bigBall.x;
			newY = lengthdir_y(100,dir) + obj_bigBall.y;
			newX2 = -lengthdir_x(100,dir) + obj_bigBall.x;
			newY2 = -lengthdir_y(100,dir) + obj_bigBall.y;
		
			//Check which spot is better to go to
			if(collision_line(newX, newY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone
			|| collision_line(obj_bigBall.x + (pushPos.x-obj_bigBall.x)*4, obj_bigBall.y + (pushPos.y-obj_bigBall.y)*4, newX, newY, obj_bigBall, false, false) != noone) { 
				pos1Valid = false; 
			}
			if(collision_line(newX2, newY2, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone
			|| collision_line(obj_bigBall.x + (pushPos.x-obj_bigBall.x)*4, obj_bigBall.y + (pushPos.y-obj_bigBall.y)*4, newX2, newY2, obj_bigBall, false, false) != noone) { 
				pos2Valid = false; 
			}
		
			if(pos1Valid && pos2Valid) { //pick the closer one to where to be
				if(point_distance(newX, newY, pushPos.x, pushPos.y) < point_distance(newX2, newY2, pushPos.x, pushPos.y)) {
					targetX = newX;
					targetY = newY;
				} else {
					targetX = newX2;
					targetY = newY2;
				}
			} else if(pos1Valid) {
				targetX = newX;
				targetY = newY;
			} else if(pos2Valid) {
				targetX = newX2;
				targetY = newY2;
			} else {
				show_debug_message("Neither position valid")
				targetX = pushPos.x;//obj_bigBall.x + (pushPos.x - obj_bigBall.x)/2;
				targetY = pushPos.y//obj_bigBall.y + (pushPos.y - obj_bigBall.y)/2;
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
}