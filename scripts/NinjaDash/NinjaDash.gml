// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NinjaDash() constructor {
	sprite = spr_ninja;
	damage = 80;
	critDamage = 160;
	ammoCost = 3;
	cooldown = 18; 
	name = "Ninja Slash"
	abilityName = "ninjaSlash"
	text = "Hold to charge your range and release to dash. Dashing into enemies deals " + string(damage) + " damage, " + string(critDamage) + " if they are poisoned."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_player.ninja = 1;
			ball_game.held = true;
		}
		return(0);
	}
	
	static abilityReleased = function(buffer) {
		ball_player.ninjaSlash = true;
		ball_player.speed = 26;
		ball_player.direction = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
		global.slow = 0;
		cool = 18;
		scr_ball_ammo(ammoCost);
		node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.ninja,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_ninjaSlash,"eventName","Bullet")
		return(cooldown);
	}
}