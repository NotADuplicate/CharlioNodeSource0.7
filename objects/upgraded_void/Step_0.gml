image_angle += 6;

if(image_xscale > 2.5) {
		up = -1;
} else if(image_xscale < 2) {
	up = 1;
}
image_xscale += up/100;
image_yscale += up/100