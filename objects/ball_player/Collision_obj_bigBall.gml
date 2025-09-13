/// @description Dribble ball
//scr_ball_move(point_direction(x,y,other.x,other.y),1,num)
if(other.murderball)
	scr_damage(5+power(other.speed,2),num,false)
else if(other.stasis == false){
	if(speed > 4) {
		scr_ball_move(direction,pushing*speed/4,num)
		speed *= .5
	}
	
	xPush = lengthdir_x(2, point_direction(other.x,other.y,x,y));
	yPush = lengthdir_y(2, point_direction(other.x,other.y,x,y));
	if(sign(other.hspeed) == sign(xPush)) { //get pushed back if ball is moving towards you
		xPush += (abs(other.hspeed)) * sign(xPush);
	}
	if(sign(other.vspeed) == sign(yPush)) { //get pushed back if ball is moving towards you
		yPush += (abs(other.vspeed)) * sign(yPush);
	}
	if(!place_meeting(x+xPush,y,ball_wall)) {
		x += xPush;
	}
	if(!place_meeting(x,y+yPush,ball_wall)) {
		y += yPush;
	}
	scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
}