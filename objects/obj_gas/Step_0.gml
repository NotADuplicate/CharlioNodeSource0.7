/// @description Insert description here
// You can write your code in this editor
image_xscale += up;
image_yscale += up;
if(image_xscale < 0.05)
	instance_destroy()
if(image_xscale > 7.5)
	up = -.05;