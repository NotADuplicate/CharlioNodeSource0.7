/// @description Status
if(num != other.num || other.armed) {
	var telekenesisNum = other.num
	with(ball_game) {
		node_send(buffer,"eventName","Targeted Status","Target",ball_player.num, "User", other.telekenesisNum, "Status Num", 30)
	}
	instance_destroy(other);
}