// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Axe() constructor {
	sprite = spr_fireaxe;
	damage = 50;
	ammoCost = 1;
	cooldown = 7; 
	critDamage = 170;
	name = "Fire Axe"
	abilityName = "fireAxe"
	text = "Swing a short range axe which deals 50 damage to enemies or 170 damage if they are burning";
	
	stats = new AbilityStats();
	stats.damage = 0;
	stats.damageMultiplier = 0.5
	stats.add_synergy("damageMultiplier", "mobility", 0.5);
	stats.add_synergy("damage", "fire", 4);
	stats.add_synergy("damageMultiplier","AP",0.15)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_axetinguisher)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai, dir) {
		ai.ammo -= ammoCost;
		dir += random_range(-1,1) * ai.inaccuracy;
		node_send(ball_game.buffer,"eventName","Bullet","Num",ai.num,"X", ai.x, "Y", ai.y, "Obj", obj_axetinguisher, "Dir", dir)
	}
	
	static aiConsider = function(ai) {
		if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) < 90) {
			show_debug_message("Close enough to axe")
			if(ai.enemyDistances[ai.mistakes*2] < 120) {
				show_debug_message("Reacting fast enough")
				if(ai.enemy.burn > 0 || ai.enemy.hp < 40) {
					show_debug_message("Going for kill")
					dir = point_direction(ai.x,ai.y,ai.enemy.x, ai.enemy.y);
					aiUse(ai,dir);
					return(cooldown);
				}
			}
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		if(ai.enemy.burn > 0 && ai.enemyDistances[0] < 300 && random(1) > 0.8 + 0.05 * ai.mistakes) {ai.state = "Thirst"; }
		return;
	}
}