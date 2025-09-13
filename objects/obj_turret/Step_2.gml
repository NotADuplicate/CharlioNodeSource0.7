/// @description Take double damage while garren buffed ppl are near
broken = false;
with(ball_other) {
	if(garren && point_distance(x,y,other.x,other.y) < 400) {
		if(global.teamNum[other.num] != global.teamNum[num]) {
			other.broken = true
		}
	}
}
with(ball_player) {
	if(obj_junglePass.garren > 0 && point_distance(x,y,other.x,other.y) < 400) {
		if(global.teamNum[other.num] != global.teamNum[num]) {
			other.broken = true
		}
	}
}