/// @description Open and close options
if(room != room1 && global.shop) {
	global.shop = false;
}
else if(global.options) {
	global.options = false
	scr_save_options();
}
else {
	global.options = true
}