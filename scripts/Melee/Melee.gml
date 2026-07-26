// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Melee() constructor {
	sprite = spr_melee;
	damage = 110;
	ammoCost = 1;
	reload = 4; 
	name = "Melee"
	
	minRange = 25;
	maxRange = 80;
	ballPush = 3;
	monsterTake = 3;
	
	stats = new AbilityStats();
	stats.damage = 2;
	stats.add_synergy("damage", "mobility", 1);
	stats.ammoSupply = 2;
	
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
			if(ammo > 0 && reload == 0 && point_distance(x,y,enemy.x, enemy.y) < 110) {
				dir = point_direction(x,y,enemy.x,enemy.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_melee);
				bullet.direction = dir;
				bullet.num = num;
				bullet.icon = spr_melee;
				reload = 24;
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(ammo > 0 && reload == 0 && point_distance(x,y,monster.x, monster.y) < 110) {
				dir = point_direction(x,y,monster.x,monster.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_melee);
				bullet.direction = dir;
				bullet.num = num;
				bullet.icon = spr_melee;
				reload = 24;
			}
		}
	}
	
	static ballShoot = function(ai) {
		with(ai) {
			if(reload == 0 && ammo > 3 && random(1) > 0.25 && point_distance(x,y, targetX, targetY) < 40) {
				show_debug_message("Shoot");
				dir = point_direction(pushPos.x,pushPos.y,obj_bigBall.x,obj_bigBall.y)
				var bullet = instance_create(x+lengthdir_x(6,dir), y+lengthdir_y(6,dir), obj_melee);
				bullet.direction = dir;
				bullet.num = 2;
				bullet.icon = spr_melee;
				reload = 30;
			}
		}
	}
}