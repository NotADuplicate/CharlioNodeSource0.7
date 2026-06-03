if(global.teamNum[num] == global.teamNum[ball_player.num]) {
	with(obj_ping) {
		if(visible && num == other.num) {
			instance_destroy();
		}
	}
	visible = true;
	alarm[1] = 40;
} else {
	instance_destroy();
}