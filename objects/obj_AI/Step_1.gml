/// @description Handle AI inputs
var _previous_state = state;
scr_ball_tower_escape();
var _tower_objective_changed = scr_ai_skirmish_tower_tick();
if(enemy != noone && state != "Escape Tower" && !_tower_objective_changed) {
switch(state) {
	case "Travel": //travel to defend tower
		if(enraged) {
			state = "Backing";
			return;
		}
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
		if(enraged) {
			state = "Backing";
			return;
		}
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
		if(enraged) {
			if(enemyDistances[3] < 450) {
				state = "Thirst";
			} else {
				state = "Backing";
			}
			return;
		}
		if(obj_bigBall.murderball > 0 && point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 180) {
			state = "Flee";
			return;
		}
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
		
		if(scr_ball_approach_committed() || (point_distance(x,y,obj_bigBall.x,obj_bigBall.y) < 300 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y, ball_wall, false, false) == noone)) {
			
		} else {
			global.aiPushing[team] = false;
			state = "Travel Ball";
		}
	break;
	case "Forward":
		if(enraged) {
			if(enemyDistances[3] < 450) {
				state = "Thirst";
			} else {
				state = "Backing";
			}
			return;
		}
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
		if(enraged) {
			state = "Thirst";
			return;
		}
		gunDir = point_direction(x,y,enemy.x,enemy.y);
		if(collision_line(x,y,enemy.x,enemy.y, ball_wall, false, false) == noone) {
			if(knownLocation < 80) {
				knownLocation+=4;
			}
			
			if (!scr_ai_ball_blocks_combat_shot(enemy)) gunObj.skirmishAction(self);
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
		
		// Navigation keeps ordinary skirmishes outside hostile tower range.
		// Do not claim the Push exception just because an enemy is under a tower.
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
			
			if (!scr_ai_ball_blocks_combat_shot(enemy)) gunObj.skirmishAction(self);
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
		if (!scr_ai_ball_blocks_combat_shot(enemy)) gunObj.skirmishAction(self);
		if(point_distance(x,y,enemy.x,enemy.y) > 650 && (levels > 0 || hp < 90) && obj_bigBall.murderball <= 0) {
			if(hp > 60 || enemy.x < 5)
				state = "Travel Ball";
			else 
				state = "Backing";
		}
	break;
	case "Backing":
		backing++;
		path_end();
		if(backing > 150) {
			x = startX;
			y = startY;
			state = "Travel"
		}
		if(enemyDistances[2] < 300) {
			state = hp > 100 ? "Skirmish" : "Flee";
		}
	break;
}

if(hp < 100 && hp < enemy.hp/2 && point_distance(x,y,enemy.x,enemy.y) < 160 && !enraged) { //flee
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
// Start the new state's route on the next alarm step, rather than continuing
// the previous state's path for up to ten steps near a corner.
if (state != _previous_state && state != "Dead") alarm[2] = 1;
