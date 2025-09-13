// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_move(dir,spd,targetN){
	if(obj_bigBall.inversion > 0)
		dir += 180;
	if(global.payload == false) {
		if(targetN == obj_client.index) { //only actually apply if you were the one who pushed it
			if(obj_bigBall.frost > 0)
				spd = spd/2;
			/*if(obj_bigBall.stasis) {
				obj_bigBall.stasisx += lengthdir_x(spd,dir)
				obj_bigBall.stasisy += lengthdir_y(spd,dir)
			}
			else { //apply motion but it will get overwritten once you hear back from server
				with(obj_bigBall) {
					motion_add(argument[0],argument[1])
					hspeed = round(hspeed*10)/10
					vspeed = round(vspeed*10)/10
				}
			}
			with(ball_game) {
				if(obj_bigBall.stasis) {
					node_send(buffer,"eventName","Ball Move","Num",targetN,"hspeed",obj_bigBall.stasisx,"vspeed",obj_bigBall.stasisy)
				}
				else {
					node_send(buffer,"eventName","Ball Move","Num",targetN,"hspeed",obj_bigBall.hspeed,"vspeed",obj_bigBall.vspeed)
				}
			}*/

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