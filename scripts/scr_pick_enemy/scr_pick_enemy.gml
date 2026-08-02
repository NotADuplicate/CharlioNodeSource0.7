function scr_pick_enemy(){
	if(enemy != noone && point_distance(x,y,enemy.x,enemy.y) < 350) {
		return;
	}
	minDist = 600;
	if(enemy == noone) { //if not have an enemy, pick anything
		minDist = 99999;
	}
	with(ball_other) {
		if(global.teamNum[num] != other.team-2) {
			dist = point_distance(x,y,other.x,other.y);
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) != noone) { dist += 200; }
			if(dist < other.minDist) {
				other.minDist = dist;
				other.enemy = self;
			}
		}
	}
	with(ball_player) {
		if(global.teamNum[num] != other.team-2) {
			dist = point_distance(x,y,other.x,other.y);
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) != noone) { dist += 200; }
			if(dist < other.minDist) {
				other.minDist = dist;
				other.enemy = self;
			}
		}
	}
}