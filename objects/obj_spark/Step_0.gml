/// @description Fade
image_angle += 20;
image_alpha -= 0.15;
if(image_alpha < 0.1)
	instance_destroy()