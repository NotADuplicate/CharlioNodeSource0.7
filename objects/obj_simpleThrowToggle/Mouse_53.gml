/// @description Toggle
xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
if(global.options && mouse_x > xp-20 && mouse_x < xp + 20 && mouse_y > yp-20 && mouse_y < yp+20 && global.optionState = "General") { //actually be clicked
	obj_options.firstDraw = true;
	obj_options.wipe = true;
	if global.simpleThrowing{
	    global.simpleThrowing = false;
	    sprite_index = spr_checkbox;
	}
	else{
	    global.simpleThrowing = true;
	    sprite_index = spr_checkedbox;
	}
}