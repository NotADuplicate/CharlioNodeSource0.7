/// @description Spectate a player
if(global.spectator || global.dead) {
	if(instance_exists(ball_other)) {
		nearst = instance_nearest(mouse_x,mouse_y,ball_other)
		if(point_distance(mouse_x,mouse_y,nearst.x,nearst.y) < 150) {
			show_debug_message("Linked")
			link = nearst;
			linked = true;
		}
		else {
			link = self;
			linked = false;
		}
	} else {
		show_debug_message("No others")
	}
}