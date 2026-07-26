// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dash() constructor {
	sprite = spr_speed;
	ammoCost = 1;
	cooldown = 5; 
	name = "Dash"
	abilityName = "dash"
	text = "Quadruples your speed for 0.25 seconds."
	
	stats = new AbilityStats();
	stats.mobility = 2;
	stats.ammoSupply = -1;
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
	        global.slow = 4;
	        ball_game.alarm[7] = 7;
			ball_player.dashing = 7;
	        scr_ball_ammo(ammoCost);
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 50)
			return(cooldown);	
		} 
		else { return(0); }
	}
	
	static aiUse = function(ai) {
		ai.burstMoving = 8;
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ai.num,"Status Num", 50)
		}
		with(ai) {
			path_speed *= 4;
			alarm[8] = 7;
		}
	}
	
	static aiConsider = function(ai) {
		if(ai.burstMoving > 0) { return 0; }
		if(ai.speed > 0) { return 0; }
		if(ai.state == "Flee" && random(1) > 0.8) {
			aiUse(ai);
			return cooldown;
		}
		if(ai.state == "Thirst" && random(1) > 0.8) {
			aiUse(ai);
			return cooldown;
		}
		if(ai.state == "Skirmish" && random(1) > 0.95 && ai.ammo > ai.maxAmmo/2) {
			aiUse(ai);
			return cooldown;
		}
		if(ai.state != "Push" && random(1) > 0.99 && ai.ammo > ai.maxAmmo*(3/4)) {
			aiUse(ai);
			return cooldown;
		}
		if((ai.state == "Travel Ball" || ai.state == "Travel") && ai.ammo == 10) {
			aiUse(ai);
			return cooldown;
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}