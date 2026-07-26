// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Shotgun() constructor {
	sprite = spr_blood;
	damage = 110;
	selfDamage = 50;
	ammoCost = 1;
	cooldown = 4; 
	name = "Shotgun"
	abilityName = "bloodshot"
	text = "Fire a projectile which deals " + string(damage) + " damage. Using this ability makes you take " + string(selfDamage) + " damage"
	
	minRange = 60;
	maxRange = 220;
	ballPush = 5;
	monsterTake = 4;
	
	stats = new AbilityStats();
	stats.damage = 4;
	stats.add_synergy("damage", "mobility", 0.5);
	stats.ammoSupply = 0;
	
	static aiDecisions = function(ai) {
		return;
	}
	
	static skirmishAction = function(ai) {
		with(ai) {
			if(ammo > 1 && reload == 0 && point_distance(x,y,enemy.x, enemy.y) < 300) {
				// calculate how much they want to shoot
				desire = (300 - point_distance(x,y,enemy.x, enemy.y))*2 + ammo*10 + (250-enemy.hp) + random_range(-70,30);
				if(desire > 200) {
					dir = point_direction(x,y,enemy.x,enemy.y)
					var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_shotgun);
					bullet.direction = dir;
					bullet.num = num;
					reload = 40;
					ammo -= 2;
				}
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(ammo > 1 && reload == 0 && point_distance(x,y,monster.x, monster.y) < 200) {
				dir = point_direction(x,y,monster.x,monster.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_shotgun);
				bullet.direction = dir;
				bullet.num = num;
				reload = 40;
				ammo -= 2;
			}
		}
	}
	
	static ballShoot = function(ai) {
		with(ai) {
			if(reload == 0 && ammo > 4 && random(1) > 0.5 && point_distance(x,y, targetX, targetY) < 40) {
				show_debug_message("Shoot");
				dir = point_direction(pushPos.x,pushPos.y,obj_bigBall.x,obj_bigBall.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_shotgun);
				bullet.direction = dir;
				bullet.num = num;
				reload = 40;
			}
		}
	}
}