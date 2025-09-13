/// @description Get batted
if(other.num == ball_player.num && melee == 0) {
	scr_ball_move(point_direction(other.x,other.y,x,y),other.dmg/6,other.num)
	melee = 10;
}