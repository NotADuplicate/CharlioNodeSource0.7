/// @description Status
if(num != other.num || other.armed) {
	instance_destroy(other);
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status","Target",ball_player.num, "User", other.num, "Status Num", 30)
	}
}