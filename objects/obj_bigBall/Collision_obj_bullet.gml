/// @description Take damage
if(other.dmg != 21) //shotguns work second best
	scr_ball_move(other.direction,other.dmg/4,other.num);
else if(other.dmg >= 20) {//pistols work better 
	if(other.num > 10) //turret shot
		scr_ball_move(other.direction,other.dmg/4,1);
	else
		scr_ball_move(other.direction,other.dmg/4,other.num);
}
else //fuck miniguns
    scr_ball_move(other.direction,other.dmg/12,other.num);
instance_destroy(other);