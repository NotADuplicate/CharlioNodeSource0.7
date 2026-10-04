function scr_tower_target(towerNum, targetNum, serverTime) {
	var timeAgo = current_time - serverTime + global.pingOffset;
	with(obj_turret) {
	    if(num == argument[0]) {
			if(argument[1] == 100) { //ball num
				target = obj_bigBall;
				charge = (timeAgo/33)*0.15;
			} else if(argument[1] == -1) { //null target
				target = noone;
			} else {
				target = global.players[argument[1]];
			}
		}
	}
}
