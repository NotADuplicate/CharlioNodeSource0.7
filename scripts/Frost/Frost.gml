// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Frost() constructor {
	sprite = spr_frost;
	damage = 20;
	duration = 6;
	ammoCost = 2;
	cooldown = 19; 
	name = "Frost Shot"
	abilityName = "Frost Shot"
	text = string("Shoot a fast moving projectile which deals " + string(damage) + " damage and frosts a target for " + string(duration) + " seconds. While frosted, the target moves at half speed and does not take knockback from any sources.");
	
	stats = new AbilityStats();
	stats.damage = 0.5;
	stats.CC = 4;
	stats.add_synergy("CC","fire",-2);
	stats.ammoSupply = -1;
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_frost)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai,dir) {
		dir += random_range(-1,1) * ai.inaccuracy;
		node_send(ball_game.buffer,"eventName","Bullet","Num",ai.num,"X", ai.x, "Y", ai.y, "Obj", obj_frost, "Dir", dir)
		ai.ammo -= ammoCost;
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && ai.enemyDistances[ai.mistakes*2] < random_range(-4000,600)) {
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