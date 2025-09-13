/// @description Slow
if(speed > 0) {
    speed -= .65;
}
else
	speed = 0;

if(place_meeting(x+hspeed,y,ball_wall)) {
	hspeed *= -1;
}
if(place_meeting(x,y+vspeed,ball_wall)) {
	vspeed *= -1;
}