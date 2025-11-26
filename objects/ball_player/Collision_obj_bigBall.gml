/// @description Dribble ball
//scr_ball_move(point_direction(x,y,other.x,other.y),1,num)
if(other.murderball)
	scr_damage(5+power(other.speed,2),num,false, spr_deathball, false)
else if(other.stasis == false){
	if(speed > 4) {
		scr_ball_move(direction,pushing*speed/3,num)
		speed *= .5
	}
	
	xPush = lengthdir_x(2, point_direction(other.x,other.y,x,y));
	yPush = lengthdir_y(2, point_direction(other.x,other.y,x,y));
	if(sign(other.hspeed) == sign(xPush)) { //get pushed back if ball is moving towards you
		xPush += (abs(other.hspeed)) * sign(xPush)/2;
	}
	if(sign(other.vspeed) == sign(yPush)) { //get pushed back if ball is moving towards you
		yPush += (abs(other.vspeed)) * sign(yPush)/2;
	}
	if(!place_meeting(x+xPush*2,y,ball_wall)) {
		x += xPush*2;
	}
	if(!place_meeting(x,y+yPush*2,ball_wall)) {
		y += yPush*2;
	}
	scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
}