if(up) {
	if(alpha < 1) {
		alpha += 0.05;
	}
} else {
	if(alpha > 0) {
		alpha -= 0.05;
	} else {
		instance_destroy();
	}
}