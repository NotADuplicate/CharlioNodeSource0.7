/// @description Insert description here
// You can write your code in this editor
if(global.options && global.optionState == "General") {
	if(surface_exists(global.optionsSurf)) {
		surface_set_target(global.optionsSurf);
		
		draw_self();
		draw_text(x,y,"Disconnect")
		
		surface_reset_target()
	}
}
