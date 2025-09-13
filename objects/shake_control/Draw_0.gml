/// @description Draw bar
if(surface_exists(global.optionsSurf)) { 
	if(global.options && global.optionState = "General") {
		surface_set_target(global.optionsSurf);
		draw_rectangle_color(x,y-32,x+400,y+32,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,obj_options.rectColor,false);
		draw_healthbar(x,y-32,x+400,y+32,global.shakeVol*50,c_black,c_green,c_green,0,false,true);
		draw_text(x+200,y,"Screen Shake")
		draw_self();
		surface_reset_target();
	}
}
else {
	global.optionsSurf = surface_create(950,600);
}