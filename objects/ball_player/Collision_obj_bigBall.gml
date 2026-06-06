/// @description Dribble ball
//scr_ball_move(point_direction(x,y,other.x,other.y),1,num)
if(other.murderball)
	scr_damage(5+power((other.xspd + other.yspd),2),num,false, spr_deathball, false)
else if(other.stasis == false){
	ballPushing = 2;
	if(speed > 4) {
		scr_ball_move(direction,pushing*speed/3,num)
		speed *= .5
	}
	xDir = lengthdir_x(1, point_direction(other.x,other.y,x,y))
	yDir = lengthdir_y(1, point_direction(other.x,other.y,x,y))
	
	xPush = xDir * (1+ abs(xspd)/3)
	yPush = yDir * (1+ abs(yspd)/3)
	
	if(sign(other.xspd) == sign(xDir)) { //get pushed back if ball is moving towards you
		xPush += (abs(other.xspd)) * sign(xPush)/3;
		if(!place_meeting(x+xPush*2,y,ball_wall)) {
			x += xPush*2;
		}
	}
	if(sign(other.yspd) == sign(yDir)) { //get pushed back if ball is moving towards you
		yPush += (abs(other.yspd)) * sign(yPush)/3;
		if(!place_meeting(x,y+yPush*2,ball_wall)) {
			y += yPush*2;
		}
	}

	scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
}