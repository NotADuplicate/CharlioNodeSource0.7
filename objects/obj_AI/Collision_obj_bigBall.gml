/// @description Push
if(other.murderball) {
	scr_dummy_damage(5+power((other.xspd + other.yspd),2),num,false, spr_deathball, false)
}
	xPush = lengthdir_x(2, point_direction(other.x,other.y,x,y));
	yPush = lengthdir_y(2, point_direction(other.x,other.y,x,y));
	
scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
if(pushingBall == 0) {
	path_speed /= 2
}
pushingBall = 4;