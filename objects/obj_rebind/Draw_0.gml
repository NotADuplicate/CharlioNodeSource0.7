/// @description Display last key so it can be rebound
if(surface_exists(global.optionsSurf)) { 
	if(global.options && global.optionState == "General") {
		surface_set_target(global.optionsSurf);
		draw_text(x,y,scr_keycode(keyboard_lastkey));
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}