/// @desc Switch rotate direction

if(!pause) pause = true;
else {
	pause = false;
	dir = !dir;
}

alarm_set(1, game_get_speed(gamespeed_fps) * 3);