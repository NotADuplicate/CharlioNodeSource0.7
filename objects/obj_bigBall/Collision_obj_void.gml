/// @description Insert description here
// You can write your code in this editor
if(other.active) {
	instance_destroy(other)
	scr_ball_move(other.direction,20,other.num);
}