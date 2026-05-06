/// @description Player be hooked
hooked = ball_player;
if(hooked != 0 && instance_exists(hooked)) {
	x = hooked.x;
	y = hooked.y;
}
global.stun = 5;

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