// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_move(dir,spd,targetN){
	if(obj_bigBall.inversion > 0)
		dir += 180;
	if(obj_bigBall.frost > 0)
		spd = spd/2;
		
	xMotion = lengthdir_x(spd,dir)
	yMotion = lengthdir_y(spd,dir)
	
	with(obj_bigBall) {
		xspd += other.xMotion;
		yspd += other.yMotion;
		lastTouched = 1;
	}
	if(targetN !== 0) {
		global.lastTouchTime = current_time;
	}
	if(global.payload == false) {
		if(targetN == obj_client.index) { //only actually apply if you were the one who pushed it

			with(obj_ballGhost) {
				motion_add(dir, spd);
			}
		}
	}
}