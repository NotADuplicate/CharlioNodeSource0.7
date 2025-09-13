/// @description Find partner
if(instance_exists(standoff_player)) {
	if(num = standoff_player.num) {
		x = standoff_player.x;
		y = standoff_player.y;
	}
}
if(instance_exists(standoff_other)) {
	with(standoff_other) {
		if(num = other.num) {
			other.x = x;
			other.y = y;
		}
	}
}