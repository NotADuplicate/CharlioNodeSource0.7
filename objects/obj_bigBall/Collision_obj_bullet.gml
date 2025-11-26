/// @description Take damage
if(other.dmg != 21) //shotguns work second best
	scr_ball_move(other.direction,other.dmg/6,other.num);
else if(other.dmg <= 21) {//pistols work better 
	scr_ball_move(other.direction,other.dmg/4,other.num);
}
instance_destroy(other);