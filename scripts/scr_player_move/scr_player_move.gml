// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_move(moveDirection,moveSpeed){
	if(ball_player.throwTime == 0) {
		dir = moveDirection;
		pushSpd = moveSpeed*global.pushSpd*0.8;
		if(ball_player.stasis) {
			ball_player.stasisx += lengthdir_x(pushSpd,dir)*0.7
			ball_player.stasisy += lengthdir_y(pushSpd,dir)*0.7
		}
		else {
			with(ball_player) {
				if(inversion <= 0)
					motion_add(moveDirection,moveSpeed*global.pushSpd)
				else {
					motion_add(moveDirection+180,moveSpeed*global.pushSpd)
					inversion -= moveSpeed*2;
					if(inversion < 0)
						inversion = 0;
				}
			}
		}
	}
}