with(obj_shop) {
	firstDraw = true;
	if(global.shopState == "Abilities") {
		with(inst_utility) {
			drawOnce = 2;
		}
	}
}
	
if window_get_fullscreen(){
	window_set_fullscreen(false);
	sprite_index = spr_checkbox;
}
else{
	window_set_fullscreen(true);
	sprite_index = spr_checkedbox;
}
alarm[1] = 1;