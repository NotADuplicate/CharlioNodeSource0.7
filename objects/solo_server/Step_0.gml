if(!instance_exists(ball_game)) { 
	instance_destroy();
	return;
}
if(global.xp > global.xpMax) {
	global.xp -= global.xpMax;
	global.xpMax += 200;
	global.leveled++;
	with(obj_AI) {
		if(global.teamNum[num] == global.teamNum[ball_player.num]) {
			levels++;
			link.setRespawnTimer += 2.2;
		}
	}
}

if(ball_game.started) {
	global.xp2 += (delta_time/1000000)*20;
	if(global.xp2 > global.xpMax2) {
		global.xp2 -= global.xpMax2;
		global.xpMax2 += 200;
		with(obj_AI) {
			if(global.teamNum[num] != global.teamNum[ball_player.num]) {
				levels++;
				link.setRespawnTimer += 2.2;
			}
		}
	}
}

if(global.leveled <= 0 && !instance_exists(obj_music) && instance_exists(ball_game)) {
	node_send(ball_game.buffer,"eventName","Open Gates");
}