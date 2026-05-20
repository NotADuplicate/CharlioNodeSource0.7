/// @description Take damage
if(other.dmg  == 12) 
	scr_ball_move(other.direction,other.dmg/5,other.num);
else
	scr_ball_move(other.direction,other.dmg/6,other.num);
instance_destroy(other);