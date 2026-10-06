if global.instantConfirm{
	global.instantConfirm = false;
	sprite_index = spr_checkbox;
}
else{
	global.instantConfirm = true;
	sprite_index = spr_checkedbox;
}