if(keyboard_check_pressed(global.mapKey) && !global.typing) {
	if(global.mapToggle) {
		global.mapShowing = !global.mapShowing;
	} else {
		global.mapShowing = true;
	}
}