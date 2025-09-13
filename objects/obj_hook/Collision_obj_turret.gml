/// @description Attach to wall
if(link != self && ready && point_distance(x,y,link.x,link.y) < 500) {
	hooked = 1;
	speed = 0;
	alarm[0] = 60;
}