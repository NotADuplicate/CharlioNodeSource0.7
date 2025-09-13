/// @description Draw "Q"
if(surface_exists(global.optionsSurf)) {
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		draw_text(x,y-35,"Map")
		draw_rectangle_color(x-20,y+10,x+20,y+30,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,false);
		//draw_text(x,y+20,variable_global_get(myButton));
		draw_self()
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}