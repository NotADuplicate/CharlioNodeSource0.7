// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Rest() constructor {
	sprite = spr_sleeping;
	ammoCost = 2;
	cooldown = 10;
	damage = 135;
	duration = 5;
	name = "Rest"
	abilityName = "rest"
	text = "Deal " +string(damage) + " damage to any nearby enemies but put yourself to sleep for " + string(duration) + " seconds.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_sleep);
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 45)
			ball_player.napping = true;
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}