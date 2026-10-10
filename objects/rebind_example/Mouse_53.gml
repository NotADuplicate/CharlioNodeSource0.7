/// @description Click on UI 
selected = false;
	var screenX = camera_get_view_x(view_camera[0])
		+x+obj_options.xp;

	var screenY = camera_get_view_y(view_camera[0])
		+y+obj_options.yp;
var hovered = point_in_rectangle(
	mouse_x,mouse_y,
	screenX-380,screenY-25,
	screenX+380,screenY+25
);
if(global.options && global.optionState == "Controls" && hovered) {
	event_user(1);
}