function scr_tower_target() {
	with(obj_turret) {
	    if(num == argument[0]) {
			if(argument[1] == 100) { //ball num
				target = obj_bigBall;
			} else if(argument[1] == -1) { //null target
				target = noone;
			} else {
				target = global.players[argument[1]];
			}
		}
	}
}
