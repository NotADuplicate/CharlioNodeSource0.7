// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Minigun() constructor {
	sprite = spr_minigun;
	ammoCost = 1;
	name = "Minigun"
	bullet = obj_minigun;
	unlocked = false;
	text = "Slows you down to rev up, and consumes lots of ammo.\n Extreme damage, extreme ball push"

	minRange = 60;
	maxRange = 250;
	ballPush = 7;
	monsterTake = 8;
	
	stats = new AbilityStats();
	stats.damage = 6;
	stats.add_synergy("damage", "mobility", 0.25);
	stats.add_synergy("damage", "CC", 0.35);
	stats.ammoSupply = -1;
	stats.add_synergy("damageMultiplier","AD",0.2)
	
	static aiUse = function(ai, dir) {
		with(ai) {
			dir += random_range(-1,1) * inaccuracy;
			xp = x + lengthdir_x(16,dir);
			yp = y + lengthdir_y(16,dir);
			with(ball_game) {
				node_send(buffer,"eventName","Bullet","Num",other.num,"X",other.xp,"Y",other.yp,"Dir",dir,"Obj",obj_shotgun,"Primary",true)
			}
			reload = 40;
			ammo -= 2;
		}
		return;
	}
	
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
					other.aiUse(self,dir);
				}
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(ammo > 1 && reload == 0 && point_distance(x,y,monster.x, monster.y) < 200) {
				dir = point_direction(x,y,monster.x,monster.y)
				other.aiUse(self,dir);
			}
		}
	}
	
	static ballShoot = function(ai) {
		with(ai) {
			if(reload == 0 && ammo > 4 && random(1) > 0.5 && point_distance(x,y, targetX, targetY) < 40) {
				show_debug_message("Shoot");
				dir = point_direction(pushPos.x,pushPos.y,obj_bigBall.x,obj_bigBall.y)
				other.aiUse(self,dir);
			}
		}
	}
}