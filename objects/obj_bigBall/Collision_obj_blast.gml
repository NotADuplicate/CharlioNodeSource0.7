/// @description Knockback
if(other.BFG) {
	scr_ball_move(point_direction(other.x,other.y,x,y),3,other.num);
	instance_destroy(other)
}
else
	scr_ball_move(point_direction(other.x,other.y,x,y),.5,other.num);