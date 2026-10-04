function scr_pick_ally(){
	if(ally != noone && point_distance(x,y,ally.x,ally.y) < 350) {
		return;
	}
	ally = noone;
	minDist = 500;
	with(ball_other) {
		if(global.teamNum[num] == other.team-2 && other.num != num) {
			dist = point_distance(x,y,other.x,other.y);
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) != noone) { dist += 200; }
			if(dist < other.minDist) {
				other.minDist = dist;
				other.ally = self;
			}
		}
	}
	with(ball_player) {
		if(global.teamNum[num] == other.team-2) {
			dist = point_distance(x,y,other.x,other.y);
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) != noone) { dist += 200; }
			if(dist < other.minDist) {
				other.minDist = dist;
				other.ally = self;
			}
		}
	}
}