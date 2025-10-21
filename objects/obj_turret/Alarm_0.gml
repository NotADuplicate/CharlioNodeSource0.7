/// @description Actually shoot
alarm[0] = 5;
if(target == instance_nearest(x,y,ball_player) && point_distance(x,y, targetX, targetY) < beamLength) {
	scr_damage(12,ball_player.num,true)
}