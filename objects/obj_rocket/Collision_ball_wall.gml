/// @description Insert description here
// You can write your code in this editor
while(place_meeting(x,y,ball_wall)) {
	x -= lengthdir_x(1,direction);
	y -= lengthdir_y(1,direction);
}
instance_destroy();