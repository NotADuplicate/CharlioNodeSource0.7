/// @description Set sound
if(global.options && global.optionState = "Audio") {
		xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
		yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	if(mouse_x > xp && mouse_x < xp + 400 && mouse_y > yp-32 && mouse_y < yp +32) {
		global.musVolume = (mouse_x-xp)/400;
		if(variable_global_exists("music")) {
			audio_sound_gain(global.music,global.musVolume,0)
		}
	}
}