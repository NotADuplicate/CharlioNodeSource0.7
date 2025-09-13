/// @description Insert description here
// You can write your code in this editor
//instance_destroy(other)
if(other.ball) {
	other.ball = false;
	scr_ball_move(point_direction(other.x,other.y,x,y),9,other.num);
}