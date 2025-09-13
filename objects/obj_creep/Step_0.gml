/// @description Pull ball towards
if(abs(scr_anglesDist(direction,point_direction(x,y,obj_bigBall.x,obj_bigBall.y))) > 110 && collision_line(x,y,obj_bigBall.x,obj_bigBall.y,ball_wall,false,false) == noone){
	hp-=1.5;
	if(ball_player.num == 1) 
		scr_ball_move(point_direction(obj_bigBall.x,obj_bigBall.y,x,y),1,1)
	if(hp < 0)
		instance_destroy();
}
image_angle = direction;