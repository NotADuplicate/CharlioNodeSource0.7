/// @description Player be hooked
if(hooked != 0) {
	x = hooked.x;
	y = hooked.y;
}
	global.stun = 5;
	//ball_player.hookSlow = 2;
		if(point_distance(x,y,link.x,link.y) > 50 && global.dead == false) {
			if(ball_player.stasis)
				scr_player_move(point_direction(x,y,link.x,link.y),1.2)
			else {
				ball_player.direction = point_direction(x,y,link.x,link.y);
				ball_player.speed = 20;
			}
		}
		else {
			instance_destroy()
		}
		alarm[4] = 1;