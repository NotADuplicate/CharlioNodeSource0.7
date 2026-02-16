/// @description Switch options state
if(global.options) {
	relativeX = xp + camera_get_view_x(view_camera[0]);
	relativeY = yp + camera_get_view_y(view_camera[0]);
	if(mouse_y > relativeY && mouse_y < relativeY+90 && mouse_x > relativeX && mouse_x < relativeX + 950) {
		wipe = true;
		if(mouse_x < relativeX + 315) {
			global.optionState = "General";
		}
		else if(mouse_x < relativeX + 630) {
			global.optionState = "Audio";
		}
		else {
			global.optionState = "Controls";
		}
	}
	mouseX = mouse_x - camera_get_view_x(view_camera[0]);
	mouseY = mouse_y - camera_get_view_y(view_camera[0]);
	if(mouseX < xp || mouseX > xp2 || mouseY < yp || mouseY > yp+height) {
		global.options = false;
	}
}