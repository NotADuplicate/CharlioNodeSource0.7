/// @description Become death
if(num != other.num || other.reflected) {
	instance_destroy(other);
	with(ball_game) {
		node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 5)
	}
}