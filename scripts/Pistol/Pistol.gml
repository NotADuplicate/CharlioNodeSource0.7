// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Pistol() constructor {
	sprite = spr_blood;
	damage = 110;
	selfDamage = 50;
	ammoCost = 1;
	cooldown = 4; 
	name = "Pistol"
	abilityName = "bloodshot"
	text = "Fire a projectile which deals " + string(damage) + " damage. Using this ability makes you take " + string(selfDamage) + " damage"
	
	minRange = 40;
	maxRange = 180;
	ballPush = 1;
	monsterTake = 1;
	
	stats = new AbilityStats();
	stats.damage = 1;
	stats.ammoSupply = 6;
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_bloodShot);
	        scr_ball_ammo(ammoCost);
			scr_damage(selfDamage,ball_player.num,false, spr_blood, false)
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai,dir) {
		var bullet = instance_create(ai.x+lengthdir_x(16,dir), ai.y+lengthdir_y(16,dir), obj_bloodShot);
		bullet.direction = dir;
		bullet.num = ai.num;
		ai.ammo -= ammoCost;
		ai.hp -= 50;
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && random(1) > 0.98 && ai.hp > 100) {
			if(collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,obj_bigBall,false,true) == noone) {
				dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y)
				aiUse(ai,dir);
				return(cooldown);
			}
		}
	}
	
	static aiDecisions = function(ai) {
		return;
	}
	
	static skirmishAction = function(ai) {
		with(ai) {
			if(point_distance(x,y,enemy.x, enemy.y) < 250) {
				if(reload == 0 && knownLocation > 12) {
					dir = point_direction(x,y,enemy.x,enemy.y)
					var bullet = instance_create(x+lengthdir_x(16,dir), y+lengthdir_y(16,dir), obj_bullet);
					bullet.direction = dir;
					bullet.num = num;
					bullet.dmg = 20;
					bullet.icon = spr_pistol;
					reload = 24;
				}
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(point_distance(x,y,monster.x, monster.y) < 250) {
				if(reload == 0) {
					dir = point_direction(x,y,monster.x,monster.y)
					var bullet = instance_create(x+lengthdir_x(16,dir), y+lengthdir_y(16,dir), obj_bullet);
					bullet.direction = dir;
					bullet.num = num;
					bullet.dmg = 20;
					bullet.icon = spr_pistol;
					reload = 24;
				}
			}
		}
	}
	
	static ballShoot = function(ai) {
		with(ai) {
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
}