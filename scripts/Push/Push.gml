// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Push() constructor {
	sprite = spr_push;
	ammoCost = 1;
	cooldown = 5; 
	name = "Push"
	abilityName = "push"
	text = "Create an object at your mouse which pushes all players and the ball away from it. The force is greater the closer to the object they are.";
	
	
	static abilityPressed = function(buffer) {
		if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 900 && global.ammo >= ammoCost) {
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", mouse_x, "Y", mouse_y, "Obj", obj_push, "Dir", 0)
			scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}