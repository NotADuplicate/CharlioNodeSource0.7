// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cleaver() constructor {
	sprite = spr_cleaver;
	damage = 35;
	ammoCost = 2;
	cooldown = 13; 
	duration = 4;
	name = "Cleaver"
	abilityName = "cleaver"
	text = "Fires a projectile which deals " + string(damage) + " damage and bleeds an enemy for " + string(duration) + " seconds. While bleeding, enemies take damage while walking proportional to how fast they are going.";
	
	stats = new AbilityStats();
	stats.damage = 2;
	stats.CC = 2;
	stats.ammoSupply = -1;
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_cleaver)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai,dir) {
		dir += random_range(-1,1) * ai.inaccuracy;
		node_send(ball_game.buffer,"eventName","Bullet","Num",ai.num,"X", ai.x, "Y", ai.y, "Obj", obj_cleaver, "Dir", dir)
		ai.ammo -= ammoCost;
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && ai.enemyDistances[ai.mistakes*2] < random_range(-8000,600)) {
			if(collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,obj_bigBall,false,true) == noone) {
				dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y)
				aiUse(ai,dir);
				return(cooldown);
			}
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}