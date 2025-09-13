/// @description Insert description here
// You can write your code in this editor
image_angle += 10
image_xscale += up
image_yscale += up
if(image_xscale > size) {
	up = -.02
}
else if(image_xscale < 0.1)
	instance_destroy()