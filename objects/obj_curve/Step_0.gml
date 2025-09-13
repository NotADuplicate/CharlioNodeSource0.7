/// @description Bounce off walls
if(place_meeting(x+hspeed,y,ball_wall)) {
	active = true;
	hspeed *= -1
}
else if(place_meeting(x,y+vspeed,ball_wall)) {
	active = true;
	vspeed *= -1
}