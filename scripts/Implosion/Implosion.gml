// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Implosion() constructor {
	sprite = spr_pushBomb;
	ammoCost = 2;
	cooldown = 12; 
	name = "Implosion Grenade"
	abilityName = "implosion"
	text = "Throw a bomb which pulls players towards it when it lands";
	
	stats = new AbilityStats();
	stats.CC = 1;
	stats.mobility = 0.5;
	stats.add_synergy("effectiveness","zoning",0.5);
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_imploder, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		if(scr_endThrow(buffer)) {
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
	}
	
	static aiUse = function(ai, xp, yp) {
		ai.ammo -= ammoCost;
		with(ball_game) {
			node_send(buffer,"Dir",global.throwing,"X",xp,"Y",yp,"Num",ai.num,"Obj",obj_imploder,"eventName","Bullet")
		}
	}
	
	static aiConsider = function(ai) {
		if(instance_exists(obj_fire) && (global.teamNum[obj_fire.num] == global.teamNum[ai.num] || obj_fire.num == ai.enemy.num)) {
			if(point_distance(ai.enemy.x,ai.enemy.y,obj_fire.x,obj_fire.y) < 250 && ai.enemyDistances[2] < 450) {
				aiUse(ai,obj_fire.x,obj_fire.y);
				return(cooldown);
			}
		}
		if(ai.state == "Thirst" && random(1) > 0.75) {
			aiUse(ai,(ai.enemy.x+ai.x)/2,(ai.enemy.y+ai.y)/2);
			return(cooldown);
		}
		if(ai.state == "Fleeing" && ai.enemyDistances[0] > 100 && ai.enemyDistances[0] < 300) {
			dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y);
			aiUse(ai,ai.enemy.x + lengthdir_x(30,dir), ai.enemy.y + lengthdir_y(30,dir));
			return(cooldown);
		}
		if(random(1) > 0.98 && ai.state == "Skirmish" && ai.enemyDistances[2] > ai.fightingDist) {
			aiUse(ai,(ai.enemy.x+ai.x)/2,(ai.enemy.y+ai.y)/2);
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}