/// @description Update pathfinding target
if(instance_exists(obj_startWall)) {
	alarm[2] = 10;
	return;
}
overlapping = collision_point(x,y,obj_AI,false,true)
if(overlapping != noone) {
	if(overlapping.state == state && num < overlapping.num) {
		scr_pathfind(x + random_range(-40,40), y + random_range(-40,40), 5);
		alarm[2] = 10;
		return;
	}
}
global.aiPushing[team] = false;
with(obj_AI) {
	if(team == other.team && state == "Push") {
		global.aiPushing[team] = true;
		if(random(1) > 0.8 && other.state == "Forward" && other.gunObj.ballPush > gunObj.ballPush) {
			state = "Forward";
			other.state = "Push";
		}
	}
}
monster = instance_nearest(x,y,obj_monster);
if(point_distance(x,y,monster.x,monster.y) < 400 && !monster.dead) {
	scr_decide_fight_monster(monster);
}

scr_pick_enemy();

fightingDist = random_range(gunObj.minRange, gunObj.maxRange);
if(ability1CD <= 0 && ability1 != noone && ammo > ability1.ammoCost) {ability1.aiDecisions(self); }
if(ability2CD <= 0 && ability2 != noone && ammo > ability2.ammoCost) {ability2.aiDecisions(self); }
if(ability3CD <= 0 && ability3 != noone && ammo > ability3.ammoCost) {ability3.aiDecisions(self); }

if(state == "Flee") {
	targetPos = scr_flee_path(enemy);
	targetX = targetPos[0];
	targetY = targetPos[1];
	if(targetX == x && targetY == y) {
		state = "Skirmish";
	}
}
if(state == "Push") {
	//check how far should be away from ball if ball under tower
	if(point_distance(obj_bigBall.x,obj_bigBall.y,tower.x,tower.y) < 150) {
		pushPos = scr_pushBallPath(tower.x,tower.y,30);
	} else {
		pushPos = scr_pushBallPath(tower.x,tower.y,20);
	}
	scr_ball_approach();
} 
else if(state == "Skirmish") {
	if(point_distance(x,y,enemy.x,enemy.y) > 700) {
		state = "Travel Ball";
	}
	dir = point_direction(enemy.x, enemy.y, x, y);
	targetX = enemy.x + lengthdir_x(fightingDist, dir);
	targetY = enemy.y + lengthdir_y(fightingDist, dir);
	if(random(1) > 0.5) {
		dir = dir + random_range(-90,90);
		xp = enemy.x + lengthdir_x(fightingDist, dir);
		yp = enemy.y + lengthdir_y(fightingDist, dir);
		if(collision_line(enemy.x,enemy.y,xp, yp, ball_wall, false, false) == noone) {
			targetX = xp;
			targetY = yp;
		}
	}
} else if(state == "Forward") {
	forwardLocation = scr_forward_position(tower.x,tower.y);
	targetX = forwardLocation.x;
	targetY = forwardLocation.y;
} else if(state == "Thirst") {
	targetX = enemy.x;
	targetY = enemy.y;
} else if(state == "Fight Monster") {
	if(fightingDist < 135) { fightingDist = 135; }
	dir = point_direction(monster.x, monster.y, x, y);
	targetX = monster.x + lengthdir_x(fightingDist, dir);
	targetY = monster.y + lengthdir_y(fightingDist, dir);
	if(random(1) > 0.5) {
		dir = dir + random_range(-90,90);
		xp = monster.x + lengthdir_x(fightingDist, dir);
		yp = monster.y + lengthdir_y(fightingDist, dir);
		if(collision_line(monster.x,monster.y,xp, yp, ball_wall, false, false) == noone) {
			targetX = xp;
			targetY = yp;
		}
	}
}

//Escape molotov
if(state == "Dodge Fire") {
	dir = point_direction(obj_fire.x, obj_fire.y, x, y);
	xp = obj_fire.x+lengthdir_x(330, dir);
	yp = obj_fire.y+lengthdir_y(330, dir);
	if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
		targetX = xp;
		targetY = yp;
	} else {
		dir += 90;
		xp = obj_fire.x+lengthdir_x(330, dir);
		yp = obj_fire.y+lengthdir_y(330, dir);
		if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
			targetX = xp;
			targetY = yp;
		}
		else {
			dir -= 180;
			xp = obj_fire.x+lengthdir_x(330, dir);
			yp = obj_fire.y+lengthdir_y(330, dir);
			if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) {
				targetX = xp;
				targetY = yp;
			}
		}
	}
}

if(state == "Travel") { //go to defend nearest friendly tower
	targetTurret = scr_pick_tower(true);
	travelTarget = scr_meetBallPath(targetTurret.x,targetTurret.y, travelCaution);
	targetX = travelTarget.x;
	targetY = travelTarget.y;
}
// TODO go collect souls
if(state != "Flee" && state != "Thirst" && state != "Dodge Fire") {
	with(ball_corpse) {
		if(global.teamNum[num] != global.teamNum[other.num] && point_distance(x,y,other.x,other.y) < 150) {
			other.targetX = x;
			other.targetY = y;
		}
	}
}

spd = link.dashing <= 0 ? 5 : 20;
if(pushingBall > 0) { spd /= 2; }
if(frost > 0) { spd = 2;}
if(bleed == 0 && state != "Dead" && speed < 0.75 && state != "Backing") {
	backing = 0;
	path = scr_pathfind(targetX, targetY, spd);
}
alarm[2] = 10;

hp += 1;
if(hp > maxhp) {hp = maxhp;}