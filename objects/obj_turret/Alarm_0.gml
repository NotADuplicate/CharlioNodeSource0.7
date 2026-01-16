/// @description Actually shoot
alarm[0] = 5;
if(target == instance_nearest(x,y,ball_player) && point_distance(x,y, targetX, targetY) < beamLength) {
	scr_damage(12,ball_player.num,true, spr_laserTrap, false)
}
if(global.testMode && target == obj_bigBall && point_distance(x,y, targetX, targetY) < beamLength) {
	scr_ball_move(point_direction(x,y,obj_bigBall.x,obj_bigBall.y),0.6,1)
}