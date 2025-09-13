instance_destroy();
global.slow = 1;
    x = round(obj_player.x + lengthdir_x(30,dir));
    y = round(obj_player.y + lengthdir_y(30,dir));
	with(ball_game) {
	node_send(buffer,"eventName","Bolt dir", "Num", ball_player.num, "Dir", 1000)
	}