function scr_pick_ally(){
	show_debug_message("Picking ally")
	if(ally != noone && point_distance(x,y,ally.x,ally.y) < 350) {
		show_debug_message("Already close to ally")
		show_debug_message(ally)
		return;
	}
	ally = noone;
	minDist = 500;
	with(ball_other) {
		if(global.teamNum[num] == other.team-2) {
			show_debug_message("Found other on same team")
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
			show_debug_message("Found player on same team")
			dist = point_distance(x,y,other.x,other.y);
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) != noone) { dist += 200; }
			if(dist < other.minDist) {
				other.minDist = dist;
				other.ally = self;
			}
		}
	}
}