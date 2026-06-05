/// @description Send x and y
if(instance_exists(ball_player) && ball_player.spectating == false) {
	node_send(buffer,"eventName","Player Update","Num",ball_player.num,"X",round(ball_player.x),"Y",round(ball_player.y),"Dir",round(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)),"Health",round(ball_player.hp));
}

alarm[0] = 1;