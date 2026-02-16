/// @description Go fullscreen
if window_get_fullscreen(){
    window_set_fullscreen(false);
    sprite_index = spr_checkbox;
}
else{
    window_set_fullscreen(true);
    sprite_index = spr_checkedbox;
}

	obj_options.firstDraw = true;
	with(obj_shop) {
		firstDraw = true;
	}
	with(inst_utility) {
		drawOnce = 2;
	}