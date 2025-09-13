/// @description Spectate a player
if(global.spectator) {
	if(instance_exists(ball_other)) {
		nearst = instance_nearest(mouse_x,mouse_y,ball_other)
		if(point_distance(x,y,nearst.x,nearst.y) < 150) {
			link = nearst;
			linked = true;
		}
		else {
			link = self;
			linked = false;
		}
	}
}