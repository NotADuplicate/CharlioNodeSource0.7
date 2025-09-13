/// @description Cant shoot through walls
if(collision_line(x,y,link.x,link.y,ball_wall,false,false) != noone) {
	instance_destroy();
}