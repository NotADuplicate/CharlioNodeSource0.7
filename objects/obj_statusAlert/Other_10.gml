if global.statusAlert{
	global.statusAlert = false;
	sprite_index = spr_checkbox;
}
else{
	global.statusAlert = true;
	sprite_index = spr_checkedbox;
}