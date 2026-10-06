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
	text = "Fires a projectile which deals " + string(damage) + " damage and bleeds an enemy for " + string(duration) + " seconds. Bleeding does huge damage only while walking.";
	tooltip = ["The earliest cleavers were not used for sports at all"]
	
	stats = new AbilityStats();
	stats.damage = 2;
	stats.CC = 2;
	stats.ammoSupply = -1;
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	unlocked = false;
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
			global.stun = 8;
			scr_ball_ammo(ammoCost)
			node_send(buffer,"eventName","Throw Projectile","num",ball_player.num,"obj", obj_cleaver, "dir", dir, "spr", spr_cleaver)
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