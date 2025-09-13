/// @description Move
if(jumping = false) {
	xspd = spd*(keyboard_check(ord("D")) - keyboard_check(ord("A")));
	yspd = spd*(keyboard_check(ord("S")) - keyboard_check(ord("W")));
}
if(xspd != 0 || yspd != 0) {
	if(place_meeting(x+xspd,y,inst_solid) == false) {
		x += xspd;
	}
	if(place_meeting(x,y+yspd,inst_solid) == false) {
		y += yspd;
	}
	global.aim += .1;
}