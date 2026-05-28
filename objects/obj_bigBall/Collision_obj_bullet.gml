/// @description Take damage
if(other.dmg == 12 || other.dmg == 24 || other.dmg == 36 || other.dmg == 19) 
	scr_ball_move(other.direction,other.dmg/5,other.num);
else
	scr_ball_move(other.direction,other.dmg/6,other.num);
instance_destroy(other);