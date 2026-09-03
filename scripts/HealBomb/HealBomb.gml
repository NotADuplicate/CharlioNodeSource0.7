// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HealBomb() constructor {
	sprite = spr_healthBomb;
	healing = 50;
	ammoCost = 4;
	cooldown = 14; 
	name = "Heal Bomb"
	abilityName = "healBomb"
	text = "Throw a bomb which heals all players by " + string(healing) + " health when it lands";
	
	stats = new AbilityStats();
	stats.healing = 4;
	stats.ammoSupply = -2;
	stats.add_synergy("healing","healPassive",2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_healBomb, sprite);
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
			node_send(buffer,"Dir",global.throwing,"X",xp,"Y",yp,"Num",ai.num,"Obj",obj_healBomb,"eventName","Bullet")
		}
	}
	
	static aiConsider = function(ai) {
		// if only ai is at 150 hp, desire to heal bomb will be at 70, 
		desire = (220 - ai.hp);
		xp = ai.x;
		yp = ai.y;
		with(ai) {
			scr_pick_ally();
		}
		if(ai.ally != noone && (220 - ai.ally.hp) > 0) {
			show_debug_message("Heal bomb ally")
			desire += (220 - ai.ally.hp);
			xp = (ai.x + ai.ally.x)/2;
			yp = (ai.y + ai.ally.y)/2;
		}
		if(desire/25 > (11-ai.ammo)) { 
			aiUse(ai,xp,yp); 
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}