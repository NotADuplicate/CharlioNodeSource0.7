/// @description Increase timer
time += delta_time/1000000;
if(time > 3) {
	if(num == ball_player.num && global.dead == false) {
		ball_player.x = x;
		ball_player.y = y;
	}
	instance_destroy();
}