// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Block() constructor {
	sprite = spr_defense;
	duration = 0.67
	cooldown = 11; 
	ammoCost = 2;
	name = "Block"
	abilityName = "block"
	text = "Become invincible for " + string(duration) + " seconds"
	
	stats = new AbilityStats();
	stats.effectiveness = 3;
	stats.add_synergy("effectiveness", "selfDamage", 1);
	stats.ammoSupply = -1;
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			if(ball_player.spellShield == 0) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 8)
				global.invincibility = 20
			}
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else { return(0) }
	}
	
	static aiUse = function(ai) {
		ai.ammo -= ammoCost;
		ai.invincibility = 20;
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ai.num,"Status Num", 8)
		}
	}
	
	static aiConsider = function(ai) {
		if(ai.state == "Dodge Fire") {
			aiUse(ai);
			return cooldown;
		}
		if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) < 250 && collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,ball_wall,false,false) == noone) {
			desire = (250 - ai.hp)*2 - ai.enemyDistances[3] + random_range(-200,25) - (10-ai.ammo)*10;
			if(ai.state == "Thirst" || ai.state == "Flee") {
				desire += 75;
			}
			if(ai.state== "Skirmish") {
				desire += 50;
			}
			if(desire > 0) {
				aiUse(ai);
				return(cooldown);
			}
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}