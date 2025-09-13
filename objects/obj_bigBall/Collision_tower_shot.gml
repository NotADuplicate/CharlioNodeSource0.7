/// @description Take damage
if(other.dmg >= 20) {//pistols work better 
	if(other.num > 10) //turret shot
		scr_ball_move(other.direction,other.dmg/4,global.lastTouch);
	else
		scr_ball_move(other.direction,other.dmg/5,other.num);
}
if(other.dmg != 17) //shotguns work second best
	scr_ball_move(other.direction,other.dmg/4,other.num);
else //fuck miniguns
    scr_ball_move(other.direction,other.dmg/12,other.num);
instance_destroy(other);