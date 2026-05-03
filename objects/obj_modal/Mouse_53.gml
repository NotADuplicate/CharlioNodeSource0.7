if(point_distance(mouse_x,mouse_y,500,480) < 40) {
	instance_destroy();
}
if(instance_exists(ball_player)) {
	instance_destroy();
}