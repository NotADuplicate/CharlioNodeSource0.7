/// @description Dribble ball
if(other.stasis == false){
	ballPushing = 2;

	xPush = lengthdir_x(1.5, point_direction(other.x,other.y,x,y))
	yPush = lengthdir_y(1.5, point_direction(other.x,other.y,x,y))
	
	if(sign(other.xspd) == sign(xPush)) { //get pushed back if ball is moving towards you
		xPush += (abs(other.xspd)) * sign(xPush)/3;
		if(!place_meeting(x+xPush*2,y,ball_wall)) {
			x += xPush*2;
		}
	}
	if(sign(other.yspd) == sign(yPush)) { //get pushed back if ball is moving towards you
		yPush += (abs(other.yspd)) * sign(yPush)/3;
		if(!place_meeting(x,y+yPush*2,ball_wall)) {
			y += yPush*2;
		}
	}

	scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
}