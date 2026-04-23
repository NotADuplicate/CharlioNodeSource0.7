/// @description Click on UI 
selected = false;
if(global.options && global.optionState == "Controls") {
	xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
	yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	if(mouse_x > xp-240 && mouse_x < xp + 240 && mouse_y > yp-30 && mouse_y < yp+30) { //actually be clicked
		event_user(1);
	}
}