// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Bat() constructor {
	sprite = SD_bat;
	damage = 50;
	maxDamage = 200;
	ammoCost = 1;
	cooldown = 16; 
	name = "Bat"
	abilityName = "bat"
	text = "Hold to charge and release to swing. Damage ramps from 50 to 200 over 3 seconds of charging. Cannot walk or attack while charging. Can hit airborne targets.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_player.batCharge = 1;
			global.slow = 0;
			ball_game.held = true;
			scr_ball_ammo(ammoCost);
		}
		return(0)
	}
	
	static abilityReleased = function(buffer) {
		global.slow = 1;
		if(ball_player.batCharge > 0) {
			cool = 12;
			node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.batCharge,"Y",0,"Num",ball_player.num,"Obj",obj_bat,"eventName","Bullet")
			ball_player.batCharge = 0;
			return(cooldown);
		}
		ball_player.batCharge = 0;
		return(0);
	}
}