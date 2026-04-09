//Get seen
/// @description Decide if enemy is visible
if(global.teamNum[num] == global.teamNum[ball_player.num]) {
	position_known = true;
}
else { //if enemy decide if appear on minimap
	position_known = false;
	with(ball_other) {
		if(sameTeam) { //only check players that are on the users team
			if(point_distance(x,y,other.x,other.y) < 500) {
				if(collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
					other.position_known = true;
				}
			}
		}
	}
	with(ball_player) {
		if(point_distance(x,y,other.x,other.y) < 500) {
			if(collision_line(x,y,other.x,other.y,ball_wall,false,false) == noone) {
				other.position_known = true;
			}
		}
	}
	if(position_known) //check more often for players actively being seen
		alarm[5] = 3;
	else
		alarm[5] = 20;
}