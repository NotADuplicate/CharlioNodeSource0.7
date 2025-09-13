/// @description Insert description here
// You can write your code in this editor
if(other.num == ball_player.num && melee == 0) {
	scr_ball_move(point_direction(other.x,other.y,x,y),19,other.num)
	melee = 10;
}