if(global.xp > global.xpMax) {
	global.xpMax += 400;
	global.leveled++;
	global.xp = 0;
}

if(global.leveled <= 0 && !instance_exists(obj_music)) {
	node_send(ball_game.buffer,"eventName","Open Gates");
}