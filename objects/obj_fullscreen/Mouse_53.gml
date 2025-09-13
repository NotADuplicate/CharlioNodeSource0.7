/// @description Go fullscreen
xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
//instance_create(xp,yp,obj_dashing);
if(global.options && mouse_x > xp-20 && mouse_x < xp + 20 && mouse_y > yp-20 && mouse_y < yp+20 && global.optionState = "General") { //actually be clicked
	obj_options.firstDraw = true;
	with(obj_shop) {
		firstDraw = true;
	}
	with(inst_utility) {
		drawOnce = 2;
	}
	//obj_options.wipe = true;
	if window_get_fullscreen(){
	    window_set_fullscreen(false);
	    sprite_index = spr_checkbox;
	}
	else{
	    window_set_fullscreen(true);
	    sprite_index = spr_checkedbox;
	}
}