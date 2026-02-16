/// @description Insert description here
// You can write your code in this editor
if((global.connected || global.testMode) && global.options && global.optionState == "General") {
	if(surface_exists(global.optionsSurf)) {
		surface_set_target(global.optionsSurf);
		
		draw_self();
		draw_text_colour(x,y-10,"Disconnect",c_red,c_red,c_red,c_red,1)
		
		surface_reset_target()
	}
}
