function scr_ball_approach(){
/*if(collision_line(obj_bigBall.x + (pushPos.x - obj_bigBall.x) * 3, obj_bigBall.y + (pushPos.y - obj_bigBall.y) * 3, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) {
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
	else*/ 
if(collision_line(obj_bigBall.x + (pushPos.x - obj_bigBall.x) * 3, obj_bigBall.y + (pushPos.y - obj_bigBall.y) * 3, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) {
	dir = point_direction(obj_bigBall.x,obj_bigBall.y,pushPos.x,pushPos.y);
	i = 1;
	done = false;
	while(!done && i < 5) {
		xp = obj_bigBall.x + lengthdir_x(30,dir+i*20);
		yp = obj_bigBall.y + lengthdir_y(30,dir+i*20);
		if(collision_line(xp, yp, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) == noone) {
			pushPos.x = xp;
			pushPos.y = yp;
			done = true;
		} else {
			xp = obj_bigBall.x + lengthdir_x(30,dir-i*20);
			yp = obj_bigBall.y + lengthdir_y(30,dir-i*20);
			if(collision_line(xp, yp, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) == noone) {
				pushPos.x = xp;
				pushPos.y = yp;
				done = true;
			}
		}
	}
}
if(!walkingAround && collision_line(obj_bigBall.x + (pushPos.x-obj_bigBall.x)*4, obj_bigBall.y + (pushPos.y-obj_bigBall.y)*4, x, y, obj_bigBall, false, false) != noone) { 
		//dont walk into the ball and push it wrong way
		show_debug_message("Walk around ball");
			
		walkingAround = true;
		finishWalkingAround = false;
		//alarm[6] = 100; // reset walking around
		dir = point_direction(obj_bigBall.x,obj_bigBall.y,x,y) + 90;
		pos1Valid = true;
		pos2Valid = true;
		newX = lengthdir_x(180,dir) + obj_bigBall.x;
		newY = lengthdir_y(180,dir) + obj_bigBall.y;
		newX2 = -lengthdir_x(180,dir) + obj_bigBall.x;
		newY2 = -lengthdir_y(180,dir) + obj_bigBall.y;
		endX = obj_bigBall.x + (pushPos.x - obj_bigBall.x) * 4;
		endY = obj_bigBall.y + (pushPos.y - obj_bigBall.y) * 4;
		if(collision_line(endX, endY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone) {
			endX = pushPos.x;
			endY = pushPos.y;
		}
		
		//Check which spot is better to go to
		if(collision_line(newX, newY, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone
		|| collision_line(endX, endY, newX, newY, obj_bigBall, false, false) != noone
		|| point_distance(newX, newY, tower.x,tower.y < 200)) { 
			pos1Valid = false; 
		}
		if(collision_line(newX2, newY2, obj_bigBall.x, obj_bigBall.y, ball_wall, false, false) != noone
		|| collision_line(endX, endY, newX2, newY2, obj_bigBall, false, false) != noone
		|| point_distance(newX2, newY2, tower.x,tower.y < 200)) { 
			pos2Valid = false; 
		}
		
		if(pos1Valid && pos2Valid) { //pick the closer one to where to be
			if(point_distance(newX, newY, x, y) < point_distance(newX2, newY2, x, y)) {
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
			gunObj.ballShoot(self);
		}
	}
	else {
		show_debug_message("Walk up to push pos");
		if(walkingAround) {
			endX = obj_bigBall.x + (pushPos.x - obj_bigBall.x) * 4;
			endY = obj_bigBall.y + (pushPos.y - obj_bigBall.y) * 4;
			while(position_meeting(endX,endY,ball_wall)) {
				show_debug_message("Moving endx out of wall")
				endX += (obj_bigBall.x - endX)/2;
				endY += (obj_bigBall.y - endY)/2;
			}
			if(point_distance(x,y,targetX, targetY) < 35) {
				if(finishWalkingAround) {
					show_debug_message("Now pathing to ball")
					walkingAround = false; 
				} else {
					show_debug_message("Heading to endX")
					targetX = endX;
					targetY = endY;
					finishWalkingAround = true;
				}
			}
		}
		if(!walkingAround) {
			targetX = pushPos.x;
			targetY = pushPos.y;
		}
		gunObj.ballShoot(self);
	}
}