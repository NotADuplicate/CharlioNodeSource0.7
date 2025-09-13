/// @description Set health text
xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
if(global.options && mouse_x < xp -20 && mouse_x > xp + 20 && mouse_y > yp-20 && mouse_y < yp+20 && global.optionState = "General") { 
	if(global.healthText){
	    global.healthText = false;
	    sprite_index = spr_checkbox;
	}
	else{
	    global.healthText = true;
	    sprite_index = spr_checkedbox;
	}
}