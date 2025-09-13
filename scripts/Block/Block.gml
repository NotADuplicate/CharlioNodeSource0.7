// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Block() constructor {
	sprite = spr_defense;
	duration = 0.67
	cooldown = 10; 
	ammoCost = 1;
	name = "Block"
	abilityName = "block"
	text = "Become invincible for " + string(duration) + " seconds"
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			if(ball_player.spellShield == 0) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 8)
				global.invincibility = 20
			}
			scr_ball_ammo(2);
			return(cooldown)
		}
		else { return(0) }
	}
}