/// @descriptio Damage and bleed
if(global.teamNum[num] != global.teamNum[other.num]) {
	obNum = other.num
	instance_destroy(other);
		with(ball_game) {
			node_send(buffer, "eventName", "Targeted Status", "Target", ball_player.num, "User", other.obNum, "Status Num", 25)
	}
}