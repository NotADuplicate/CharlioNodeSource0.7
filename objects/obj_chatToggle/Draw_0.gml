/// @description Draw box on surface
if(surface_exists(global.optionsSurf)) { 
	if(global.options && global.optionState == "General") {
		surface_set_target(global.optionsSurf);
		draw_self();
		draw_text(x,y-30,string_hash_to_newline("Chat Enabled"));
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}