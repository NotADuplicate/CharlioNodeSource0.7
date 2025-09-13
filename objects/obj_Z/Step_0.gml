/// @description Insert description here
// You can write your code in this editor
y-= 2;
x += 1;
image_xscale += .01;
image_yscale += .01;
if(image_alpha < .3)
	instance_destroy();
else
	image_alpha-= 0.005