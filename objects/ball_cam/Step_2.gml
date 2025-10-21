/// @description Follow player if supposed to, not spectating
if(global.spectator == false) {
	if(instance_exists(ball_player)) {
		if(global.dead) {
			//x = x
		}
		else {
			if(ball_player.y < 3850) {
				if(obj_bigBall.drone == ball_player.num) {
				x = obj_bigBall.x;
				y = obj_bigBall.y;
				}
				else {
				x = ball_player.x;
				y = ball_player.y;
				}
			}
			else {
				x = 5780
				y = 4550;
			}
		}
	}

	if(global.shop && global.dead == false) {
		if(position_meeting(ball_player.x,ball_player.y,obj_regen) == false) {
			global.shop = false
			y = 0;
		}
	}
	
	//Screen Shake
	if(global.screenShake > 0) {
		global.screenShake -= 0.3
		if(global.screenShake < 0.1) {
			global.screenShake = 0
		}
		view_xport[0] = random_range(-global.screenShake,global.screenShake)*global.shakeVol;
		view_yport[0] = random_range(-global.screenShake,global.screenShake)*global.shakeVol;
	}

}
