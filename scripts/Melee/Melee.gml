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
	stats.add_synergy("damageMultiplier","AD",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_bloodShot);
	        scr_ball_ammo(ammoCost);
			scr_damage(selfDamage,ball_player.num,false, spr_blood, false)
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai, dir) {
		with(ai) {
			dir += random_range(-1,1) * inaccuracy;
			xp = x + lengthdir_x(16,dir);
			yp = y + lengthdir_y(16,dir);
			with(ball_game) {
				node_send(buffer,"eventName","Bullet","Num",other.num,"X",other.xp,"Y",other.yp,"Dir",dir,"Obj",obj_melee,"Primary",true)
			}
			reload = 24;
			ammo -= 1;
		}
		return;
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
				other.aiUse(self,dir);
			}
		}
	}
	
	static monsterAction = function(ai) {
		with(ai) {
			if(ammo > 0 && reload == 0 && point_distance(x,y,monster.x, monster.y) < 110) {
				dir = point_direction(x,y,monster.x,monster.y)
				other.aiUse(self,dir);
			}
		}
	}
	
	static ballShoot = function(ai) {
		with(ai) {
			if(reload == 0 && ammo > 3 && random(1) > 0.25 && point_distance(x,y, targetX, targetY) < 40) {
				show_debug_message("Shoot");
				dir = point_direction(pushPos.x,pushPos.y,obj_bigBall.x,obj_bigBall.y)
				other.aiUse(self,dir);
			}
		}
	}
}