/// @description Stop back
if(keyboard_check_released(global.backKey) && global.typing == false) {
	if(back > 6) //if just pressed b then keep backing until its pressed again
		back = 0;
}	