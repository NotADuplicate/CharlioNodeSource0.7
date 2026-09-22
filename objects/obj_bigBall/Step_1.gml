/// @description Fade to/from death touch
if(deathTouching && !murderball) {
	var dt = delta_time / 30000;
	deathTouchProgress += dt;
	if(deathTouchProgress > 10) {
		deathTouchProgress = 10;
		murderball = true;
		deathTouching = false;
		deathTouchDuration = 270;
	}
} else if(murderball) {
	var dt = delta_time / 30000;
	deathTouchDuration -= dt;
	deathTouchProgress = min(deathTouchDuration, 10);
	if(deathTouchDuration < 0) {
		murderball = false;
		deathTouchProgress = 0;
	}
}

depth = 1 + (y/3000)