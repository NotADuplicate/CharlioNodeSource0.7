// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wall() constructor {
	sprite = spr_barrier;
	ammoCost = 2;
	cooldown = 14; 
	name = "Wall"
	abilityName = "wall"
	text = "Places a breakable wall where your cursor is"
	
	
	static abilityPressed = function(buffer) {
		if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo >= ammoCost) {
			dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_barrier, "Dir", dir)
		    scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else { return(0); }
	}
}