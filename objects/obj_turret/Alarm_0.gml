/// @description Actually shoot
alarm[0] = 5;
if(target == instance_nearest(x,y,ball_player) && point_distance(x,y, targetX, targetY) < beamLength) {
	scr_damage(12,ball_player.num,true, spr_laserTrap, false)
}
if(target == obj_bigBall && point_distance(x,y, targetX, targetY) < beamLength) {
	var shootingX = targetX;
	var shootingY = targetY;
	if(vertical) {
		shootingY -= y;
		shootingY *= 4;
		shootingY += y;
	} else {
		shootingX -= x;
		shootingX *= 4;
		shootingX += x;
	}
	scr_ball_move(point_direction(x,y,shootingX, shootingY),3,0)
}