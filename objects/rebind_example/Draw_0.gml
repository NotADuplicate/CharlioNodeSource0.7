/// @description Draw "Q"
if(surface_exists(global.optionsSurf)) {
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		draw_text(x,y-35,txt)
		draw_rectangle_color(x-80,y,x+80,y+50,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,false);
		if(selected) 
			draw_text(x,y+20,"Press any button");
		else
			draw_text(x,y+20,variable_global_get(myButton));
		draw_self()
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}


