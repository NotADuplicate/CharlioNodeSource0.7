/// @description Handle AI inputs
if(enemy != noone) {
switch(state) {
	case "Travel": //travel to defend tower
		if(point_distance(x,y,targetX,targetY) < 100) {
			state = "Travel Ball";
		}
		if(point_distance(x,y,enemy.x,enemy.y) < 450 && collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			//if near player
			if(collision_line(x,y,enemy.x,enemy.y, obj_bigBall, false, false) != noone && !global.aiPushing[team]) {
				state = "Push";
				global.aiPushing[team] = true;
			} else {
				state = "Skirmish";
			}
		}
		else if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			//if near ball
			if(global.aiPushing[team]) 
				state = "Forward"
			else {
				state = "Push";
				global.aiPushing[team] = true;
			}
		}
	break;
	case "Travel Ball": //travel to the ball after respawn
		targetX = obj_bigBall.x;
		targetY = obj_bigBall.y;
		if(random(1) > 0.95 && abs(gunDir - pointDir) < 15) {
			gunDir = random_range(0,360);
		}
		if(point_distance(x,y,enemy.x,enemy.y) < random_range(100,450) && collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			//if near player
			if(collision_line(x,y,enemy.x,enemy.y, obj_bigBall, false, false) != noone) {
				if(global.aiPushing[team]) 
					state = "Forward"
				else {
					state = "Push";
					global.aiPushing[team] = true;
				}
			} else {
				state = "Skirmish";
			}
		}
		else if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 150 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			//if near ball
			if(global.aiPushing[team]) 
				state = "Forward"
			else {
				state = "Push";
				global.aiPushing[team] = true;
			}
		}
	break;
	case "Push":
		gunDir = point_direction(x,y,obj_bigBall.x,obj_bigBall.y);
		if(point_distance(x,y,enemy.x,enemy.y) < 250 && collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			if(collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone && random(1) > 0.95) {
				if(recentlySwithced == 0) {
					state = "Skirmish";
					global.aiPushing[team] = false;
					recentlySwithced = 80;
				}
			}
		}
		
		if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			
		} else {
			global.aiPushing[team] = false;
			state = "Travel Ball";
		}
	break;
	case "Forward":
		if(point_distance(x,y,enemy.x,enemy.y) < 350 && collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			if(collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone && random(1) > 0.75) {
				if(recentlySwithced == 0) {
					state = "Skirmish";
					recentlySwithced = 80;
				}
			}
		}
		
		if(point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone) {
			if(global.aiPushing[team] = false) {
				state = "Push";
				global.aiPushing[team] = true;
			}
		} else {
			state = "Travel Ball";
		}
	break;
	case "Skirmish":
		gunDir = point_direction(x,y,enemy.x,enemy.y);
		if(collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			if(knownLocation < 80) {
				knownLocation+=4;
			}
			
			gunObj.skirmishAction(self);
		} else {
			if(knownLocation > 0 && enemyDistances[0] < 550) {
				knownLocation--;
			} else {
				state = "Travel Ball";
			}
		}
		if(random(1) > 0.99 && point_distance(x,y,obj_bigBall.x, obj_bigBall.y) < 500) {
			if(recentlySwithced == 0) {
				if(global.aiPushing[team]) 
					state = "Forward"
				else {
					state = "Push";
					global.aiPushing[team] = true;
				}
				recentlySwithced = 80;
			}
		}
		
		//Stop chasing under tower
		turret = instance_nearest(x,y,obj_turret);
		if(point_distance(enemy.x,enemy.y,turret.x,turret.y) < 150 && global.teamNum[turret.num] != global.teamNum[num]) { 
			if(global.aiPushing[team]) 
				state = "Forward"
			else {
				state = "Push";
				global.aiPushing[team] = true;
			}
		}
		//thirst down low enemy
		if(hp > 70 && (enemy.hp < 50 || (enemy.hp < 100 && enemy.frost > 30))) {
			state = "Thirst";
		}
	break;
	case "Fight Monster": 
		gunDir = point_direction(x,y,monster.x,monster.y);
		gunObj.monsterAction(self);
		if(point_distance(x,y,monster.x,monster.y) > 450)
			state = "Travel";
		
	break;
	case "Thirst":
		gunDir = point_direction(x,y,enemy.x,enemy.y);
		if(collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			if(knownLocation < 80) {
				knownLocation+=4;
			}
			
			gunObj.skirmishAction(self);
		} else {
			if(knownLocation > 0) {
				knownLocation--;
			} else {
				state = "Travel Ball";
			}
		}
		if(hp < 50 || enemy.hp > 100) {
			state = "Skirmish";
		}
	break;
	case "Dodge Fire": //continues until fire is gone
		if(instance_exists(obj_fire) && point_distance(x,y,obj_fire.x,obj_fire.y) < 250) {			
			/*if(point_distance(obj_bigBall.x,obj_bigBall.y, obj_fire.x, obj_fire.y) > 400) {
				if(global.aiPushing[team]) 
					state = "Forward"
				else {
					state = "Push";
					global.aiPushing[team] = true;
				}
			} else if(point_distance(enemy.x,enemy.y, obj_fire.x, obj_fire.y) > 400) {
				state = "Skirmish";
			}*/
		} else {
			state = "Travel Ball";
		}
	break;
	case "Flee": 
		gunDir = point_direction(x,y,enemy.x,enemy.y);
		gunObj.skirmishAction(self);
		if(point_distance(x,y,enemy.x,enemy.y) > 550 && (levels > 0 || hp < 90)) {
			if(hp > 60 || enemy.x < 5)
				state = "Travel Ball";
			else 
				state = "Backing";
		}
	break;
	case "Backing":
		backing++;
		if(backing > 150) {
			x = startX;
			y = startY;
			state = "Travel"
		}
		if(enemyDistances[2] < 300) {
			state = "Skirmish";
		}
	break;
}

if(hp < 100 && hp < enemy.hp/2 && point_distance(x,y,enemy.x,enemy.y) < 160) { //flee
	state = "Flee";
}
}
//Get pushed
if(frost > 0) {
	speed = 0;
}
if(speed > 0.5) {
	path_end();
}

if(reload > 0) {reload--;}
if(recentlySwithced > 0) {recentlySwithced--;}