// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Ghost() constructor {
	sprite = spr_ghost;
	duration = 2;
	cooldown = 25; 
	ammoCost = 2;
	name = "Ghost"
	abilityName = "ghost"
	text = "Become ghosted for " + string(duration) + " seconds. While ghosted you take no damage or knockback from AD sources"
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			if(ball_player.spellShield == 0) {
				ball_player.ghosting = 60;
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 43)
			}
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else { return(0) }
	}
}