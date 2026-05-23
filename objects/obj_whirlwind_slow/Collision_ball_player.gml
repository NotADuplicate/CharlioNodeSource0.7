if(active && other.num != num) {
	other.speed *= 0.4;
	scr_player_move(point_direction(other.x,other.y,x,y), point_distance(other.x,other.y,x,y)/5)
}