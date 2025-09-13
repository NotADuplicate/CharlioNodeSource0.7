/// @description send forces
if(speed > 0) {
	with(ball_game) {
		node_send(buffer,"eventName","Ball Move","num",ball_player.num,"speed",other.speed,"direction",other.direction, "timestamp", current_time + global.pingOffset)
	}
	speed = 0;
	x = 100;
	y = 100;
}