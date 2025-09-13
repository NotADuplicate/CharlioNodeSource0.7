/// @description Set shake
if(global.options && global.optionState = "General") {
	xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
	yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	if(mouse_x > xp && mouse_x < xp + 400 && mouse_y > yp-32 && mouse_y < yp +32) {
		global.shakeVol = (mouse_x-xp)/200;
		//if(!audio_is_playing(snd_dash))	
	}
}