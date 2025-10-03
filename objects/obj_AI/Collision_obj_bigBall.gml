/// @description Push
	xPush = lengthdir_x(2, point_direction(other.x,other.y,x,y));
	yPush = lengthdir_y(2, point_direction(other.x,other.y,x,y));
	
scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)