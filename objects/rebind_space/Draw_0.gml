/// @description Draw "Q"
if(surface_exists(global.optionsSurf)) { 
	surface_set_target(global.optionsSurf);
	draw_text(x,y-35,"Third Ability")
	draw_text(x,y+20,global.spacebutton);
	draw_self()
	surface_reset_target();
}
else {
	global.optionsSurf = surface_create(950,600);
}
