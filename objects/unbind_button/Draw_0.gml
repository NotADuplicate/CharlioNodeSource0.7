/// @description Insert description here
// You can write your code in this editor
if(surface_exists(global.optionsSurf)) {
	if(global.options && global.optionState == "Controls") {
		surface_set_target(global.optionsSurf);
		draw_self()
		draw_text_color(x,y,"Reset Keys",c_black,c_black,c_black,c_black,1)
		surface_reset_target();
	}
}