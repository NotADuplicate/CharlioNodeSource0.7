/// @description Track mouse when not right clicking
if(mouse_check_button(mb_right) == false) {
	xp = x;
	yp = y;
	x = mouse_x;
	y = mouse_y;
	dist = point_distance(x,y,xp,yp);
	global.aim += dist / 150;
}
if(global.aim > minimum) {
	global.aim -= global.accuracy*.05;
	if(global.aim > 2.5) 
		global.aim = 2.5;
}
else
	global.aim = minimum;
if(global.accuracy = 5)
	global.aim = 0;
image_xscale = global.aim + .5;
image_yscale = global.aim + .5;