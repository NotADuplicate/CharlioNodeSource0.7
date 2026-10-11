/// Determine if visible if not on same team as player
seen = false;
alpha = 0;
with(ball_other) {
	if(global.teamNum[num] == global.teamNum[ball_player]) {
		var nameDist = point_distance(x,y,other.x,other.y)
		if(nameDist < 450 && collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
			other.seen = true;
			other.alpha = max(other.alpha, clamp((450-nameDist)/100,0,1));
		}
	}
}
with(ball_player) {
	var nameDist = point_distance(x,y,other.x,other.y)
	if(nameDist < 450 && collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
		other.seen = true;
		other.alpha = max(other.alpha, clamp((450-nameDist)/100,0,1));
	}
}
alarm[0] = 10;