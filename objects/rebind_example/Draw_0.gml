/// @description Draw "Q"
if(surface_exists(global.optionsSurf)) {
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
		yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
		draw_set_alpha(0.75)
		if(mouse_x > xp-240 && mouse_x < xp + 240 && mouse_y > yp-30 && mouse_y < yp+30) {
			draw_rectangle_colour(x-250,y-30,x+250,y+30,#2222bb,#2222bb,#2222bb,#2222bb,false);
			draw_rectangle_colour(x-244,y-24,x+244,y+24,#5555ff,#5555ff,#5555ff,#5555ff,false);
		} else {
			draw_rectangle_colour(x-250,y-30,x+250,y+30,#000099,#000099,#000099,#000099,false);
			draw_rectangle_colour(x-244,y-24,x+244,y+24,#2222bb,#2222bb,#2222bb,#2222bb,false);
		}
		
		
		draw_text(x-150,y-10,txt)
		if(selected) 
			draw_text(x+150,y-10,"Press any button");
		else
			draw_text(x+150,y-10,variable_global_get(myButton));
		
		draw_set_alpha(1)
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}