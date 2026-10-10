if(global.connected || global.testMode) {
	if(image_alpha < 0.75) { image_alpha += 0.05; }
} else {
	if(image_alpha > 0.1) { image_alpha -= 0.05; }
}