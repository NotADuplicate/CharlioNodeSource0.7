// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_move(dir,spd,targetN){
	if(obj_bigBall.inversion > 0)
		dir += 180;
	if(global.payload == false) {
		if(targetN == obj_client.index || global.testMode) { //only actually apply if you were the one who pushed it
			if(obj_bigBall.frost > 0)
				spd = spd/2;

			with(obj_bigBall) {
				motion_add(dir,spd)
				lastTouched = 1;
			}
			with(obj_ballGhost) {
				motion_add(dir, spd);
			}
			if(global.predict)
				global.lastTouchTime = current_time;
		}
	}
}