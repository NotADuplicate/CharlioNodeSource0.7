// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GrenadeLauncher() constructor {
	sprite = spr_blood;
	damage = 110;
	selfDamage = 50;
	ammoCost = 1;
	cooldown = 4; 
	name = "Grenade Launcher"
	abilityName = "bloodshot"
	text = "Fire a projectile which deals " + string(damage) + " damage. Using this ability makes you take " + string(selfDamage) + " damage"
	
	minRange = 40;
	maxRange = 190;
	ballPush = 1;
	monsterTake = 3;
	
	stats = new AbilityStats();
	stats.damage = 3;
	stats.mobility = 2;
	stats.selfDamage = 2;
	
	static aiDecisions = function(ai) {
		return;
	}
	
	static aiUse = function(ai, dir, timer) {
		with(ai) {
			dir += random_range(-10,10) * mistakes;
			var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_grenade);
			bullet.direction = dir;
			bullet.num = num;
			bullet.alarm[0] = timer;
			reload = 30;
			ammo -= 1;
		}
		return;
	}
	
	static skirmishAction = function(ai) {
		with(ai) {
			if(ammo > 1 && reload == 0 && point_distance(x,y,enemy.x, enemy.y) < 240) {
				// calculate how much they want to shoot
				desire = (300 - abs(point_distance(x,y,enemy.x, enemy.y))-100)*2 + ammo*5 + (250-enemy.hp) + random_range(-30,30);
				if(desire > 150) {
					dir = point_direction(x,y,enemy.x,enemy.y)
					other.aiUse(self,dir,floor(random_range(1,4) + enemyDistances[0]/20));
				}
			}
			if(state == "Thirst") {
				if(burstMoving > 0) { return; }
				if(hp > random_range(50,500) && point_distance(x,y,enemy.x,enemy.y) > 200 && collision_line(enemy.x,enemy.y,x, y, ball_wall, false, false) == noone) {
					dir = point_direction(enemy.x, enemy.y, x, y);
					burstMoving = 20;
					other.aiUse(self,dir,1);
					return;
				}
			} else if(state == "Flee") {
				if(burstMoving > 0) { return; }
				if(point_distance(x,y,enemy.x,enemy.y) > 170) { return 0; }
				if(hp < random_range(50,250)) { return; }
				burstMoving = 20;
				dir = point_direction(enemy.x, enemy.y, x,y);
				xp = x + lengthdir_x(110, dir);
				yp = y + lengthdir_y(110, dir);
				if(collision_line(x,y,xp,yp,ball_wall,false,false) == noone) { //if no walls behind them, blast off
					other.aiUse(self,dir,1);
				}
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(ammo > 1 && reload == 0 && point_distance(x,y,monster.x, monster.y) < 200) {
				dir = point_direction(x,y,monster.x,monster.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_grenade);
				bullet.direction = dir;
				bullet.num = num;
				bullet.alarm[0] = floor(random_range(1,4) + point_distance(x,y,monster.x,monster.y)/20);
				reload = 30;
				ammo -= 1;
			}
		}
	}
	
	static ballShoot = function(ai) { //grenade launcher not for ball push
		return;
	}
}