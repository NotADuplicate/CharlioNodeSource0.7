if(active && other.num != num) {
	other.speed *= 0.4;
	with(other) {
		motion_add(point_direction(x,y,other.x,other.y), point_distance(other.x,other.y,x,y)/5);
	}
}