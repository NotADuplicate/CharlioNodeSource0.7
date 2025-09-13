// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BlastOff() constructor {
	sprite = spr_engine;
	damage = 80;
	ammoCost = 2;
	cooldown = 15; 
	duration = 8;
	name = "Blast Off"
	abilityName = "blastOff"
	text = "Create a short range rocket blast which sends you flying in the opposite direction. Hitting an enemy with the blast deals " + string(damage) + " damage and burns for 8 seconds.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_rocketBlast,"eventName","Bullet")
		    scr_ball_ammo(ammoCost);
			scr_player_move(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)+180,20);
			return(cooldown);
		}
		else { return(0); }
	}
}