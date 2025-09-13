/// @description Insert description here
// You can write your code in this editor
if(image_alpha < .5) {
	image_alpha += .03;
}
else if(image_alpha < .9) {
	image_alpha = 1;
	alarm[1] = 80;
	image_speed = 1;
}