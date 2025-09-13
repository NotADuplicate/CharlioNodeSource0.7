/// @description Pull things
if(hooked == obj_bigBall) {
	x = hooked.x;
	y = hooked.y;
	if(obj_bigBall.stasis) 
		scr_ball_move(point_direction(hooked.x,hooked.y,link.x,link.y),0.6,num)
	else
		scr_ball_move(point_direction(hooked.x,hooked.y,link.x,link.y),1.2,num)
}
else if(hooked == 1) {//chained to wall
	if(num == ball_player.num) {
		if(point_distance(x,y,link.x,link.y) > 30) {
			ball_player.direction = point_direction(link.x,link.y,x,y);
			ball_player.speed = 18;
		}
		else {
			instance_destroy()
		}	
	} 
	else if(point_distance(x,y,link.x,link.y) < 30) {
		instance_destroy();
	}
}
else if(hooked != 0) {
	x = hooked.x;
	y = hooked.y;
	if(point_distance(x,y,link.x,link.y) > 600 || point_distance(x,y,link.x,link.y) < 20)
		instance_destroy();
}