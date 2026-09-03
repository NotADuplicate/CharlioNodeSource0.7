// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Molotov() constructor {
	sprite = spr_molotov;
	dps = 60;
	ammoCost = 2;
	duration = 3;
	cooldown = 20; 
	name = "Molotov"
	abilityName = "molotov"
	text = "Throw a molotov which creates a fire when it lands, dealing " + string(dps) + " damage per second and applying fire to anyone who stands in it (excludes allies but not you).";
	
	stats = new AbilityStats();
	stats.damage = 1.5;
	stats.fire = 2;
	stats.selfDamage = 0.5;
	stats.zoning = 4;
	stats.add_synergy("damage","CC",1)
	stats.ammoSupply = -1;
	stats.add_synergy("damageMultiplier","AP",0.2)
	stats.add_synergy("selfDamage", "resistance", -0.5);
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_molotov, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		if(scr_endThrow(buffer)) {
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
	}
	
	static aiUse = function(ai, xp, yp) {
		xp += random_range(-40,40) * ai.mistakes;
		yp += random_range(-40,40) * ai.mistakes;
		ai.ammo -= ammoCost;
		with(ball_game) {
			node_send(buffer,"Dir",global.throwing,"X",xp,"Y",yp,"Num",ai.num,"Obj",obj_molotov,"eventName","Bullet")
		}
	}
	
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && random(1) > 0.98) {
			aiUse(ai,ai.enemy.x,ai.enemy.y);
			return(cooldown);
		}
		if(ai.state == "Fleeing" && ai.enemyDistances[0] > 150 && ai.enemyDistances[0] < 300) {
			aiUse(ai,(ai.x+ai.enemy.x*2)/3, (ai.y+ai.enemy.y*2)/3);
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}