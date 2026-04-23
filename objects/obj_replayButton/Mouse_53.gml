///Go back to lobby
xp = camera_get_view_x(view_camera[0])+x;
yp = camera_get_view_y(view_camera[0])+y;
highlighted = mouse_x > xp - 150 && mouse_x < xp + 150 && mouse_y < yp + 20 && mouse_y > yp -20
if(highlighted) {
	with(obj_client) {
		activeGame = false;
		alarm[2] = 1;
	}
}