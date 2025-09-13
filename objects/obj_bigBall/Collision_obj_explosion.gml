/// @description Take damage
if(other.BFG)
	scr_ball_move(point_direction(other.x,other.y,x,y),other.dmg/2,other.num);
else
	scr_ball_move(point_direction(other.x,other.y,x,y),other.dmg/10,other.num);
instance_destroy(other)