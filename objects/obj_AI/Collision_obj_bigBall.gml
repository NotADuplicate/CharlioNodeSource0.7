/// @description Push
if(other.murderball) {
	scr_dummy_damage(5+power((other.xspd + other.yspd),2),num,false, spr_deathball, false)
}
// Repositioning/retreating must not repeatedly shove the ball backwards.
if (state == "Escape Tower" || (state == "Push" && walkingAround)) exit;
if (state == "Push" && is_struct(pushPos)) {
	// The ball can cross the bot between navigation updates.
	var _forward = (other.x - x) * (other.x - pushPos.x)
		+ (other.y - y) * (other.y - pushPos.y);
	if (_forward <= 0) exit;
}
	xPush = lengthdir_x(2, point_direction(other.x,other.y,x,y));
	yPush = lengthdir_y(2, point_direction(other.x,other.y,x,y));
	
scr_ball_move(point_direction(xPush,yPush,0,0),pushing*sqrt(point_distance(0,0,yPush,xPush)),num)
if (state == "Push" && !walkingAround) ballBodyContact = true;
if(pushingBall == 0) {
	path_speed /= 2
}
pushingBall = 4;