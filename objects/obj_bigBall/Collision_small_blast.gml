/// @description Knockback
if(other.dir == -1)
	scr_ball_move(point_direction(other.x,other.y,x,y),.25,other.num);
else
	scr_ball_move(other.dir,.5,other.num);