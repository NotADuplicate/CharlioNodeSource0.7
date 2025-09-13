/// @description Draw "Q"
if(surface_exists(global.optionsSurf)) {
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		draw_text(x,y-35,"Back")
		draw_text(x,y+20,global.backbutton);
		draw_self()
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}


