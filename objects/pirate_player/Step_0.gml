/// @description Insert description here
// You can write your code in this editor
if(jumping = false) {
	xspd = spd*(keyboard_check(ord("D")) - keyboard_check(ord("A")));
	yspd = spd*(keyboard_check(ord("S")) - keyboard_check(ord("W")));
}
if(place_meeting(x+xspd,y,inst_solid) == false) {
	x += xspd;
}
if(place_meeting(x,y+yspd,inst_solid) == false) {
	y += yspd;
}

///Regen cloak
if(cloak < 100) {
	cloak += .5;
}