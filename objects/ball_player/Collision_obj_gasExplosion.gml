/// @description Big damage
scr_player_move(point_direction(other.x,other.y,x,y),6);
scr_damage(20,other.num,false);
	if(frost > 0) {
		frost = 0;
		moveSpd++;
	}
	if(burn < 100) {
		burn += 5;
		burnNum = other.num
	}