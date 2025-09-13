/// @description Insert description here
// You can write your code in this editor
//image_angle = direction;
if(sign(x-obj_bigBall.x) != side) {
	hp--;
	obj_bigBall.vspeed = obj_bigBall.vspeed*.95
	scr_ball_move(point_direction(obj_bigBall.x,obj_bigBall.y,x+20*hspeed,y),1,1)
	if(hp < 0)
		instance_destroy();
	
}