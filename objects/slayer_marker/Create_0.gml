/// @description Insert description here
// You can write your code in this editor
x = 920;
y = 60
image_xscale = 2;
image_yscale = 1.5
alarm[0] = 150;
alarm[1] = 1;
suicide = false;
victim = "";
while(place_meeting(x,y,kill_marker) || place_meeting(x,y,slayer_marker)) {
	y += 90;
}