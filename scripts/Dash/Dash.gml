// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dash() constructor {
	sprite = spr_speed;
	ammoCost = 1;
	cooldown = 3; 
	name = "Dash"
	abilityName = "dash"
	text = "Triples your speed for 0.5 seconds."
	
	
	static abilityPressed = function(buffer) {
		if(ball_player.frost == 0 && global.ammo >= ammoCost) {
	        global.slow = 3;
	        ball_game.alarm[7] = 10;
			ball_player.dashing = 10;
	        scr_ball_ammo(ammoCost);
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 50)
			return(cooldown);	
		} 
		else { return(0); }
	}
}