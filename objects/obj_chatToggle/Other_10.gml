if global.chatEnabled{
	global.chatEnabled = false;
	sprite_index = spr_checkbox;
}
else{
	global.chatEnabled = true;
	sprite_index = spr_checkedbox;
}