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
		show_debug_message("Swing axe")
		var axe = instance_create_depth(ai.x,ai.y,ai.depth,obj_axetinguisher);
		axe.direction = dir;
		axe.image_angle = dir;
		axe.num = ai.num;
	}
	
	static aiConsider = function(ai) {
		if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) < 90) {
			show_debug_message("Close enough to axe")
			if(ai.enemyDistances[6] < 160 || ai.state == "Thirst") {
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
		if(ai.enemy.burn > 0 && ai.enemyDistances[0] < 400 && random(1) > 0.6) {ai.state = "Thirst"; }
		return;
	}
}