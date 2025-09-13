/// @description Drone control
if(instance_exists(ball_player) && drone == ball_player.num) {
    xspd = (keyboard_check(ord("D"))-keyboard_check(ord("A")))
    yspd = (keyboard_check(ord("S"))-keyboard_check(ord("W")))
	global.stun = 2;
	if(xspd != 0 || yspd != 0) { //check if not moving
		if(point_distance(hspeed+xspd,vspeed+yspd,0,0) < 15 || point_distance(hspeed+xspd,vspeed+yspd,0,0) < speed)
			scr_ball_move(point_direction(0,0,xspd,yspd),1,ball_player.num)
	}
}