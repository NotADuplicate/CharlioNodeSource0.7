/// @description Send x and y
if(instance_exists(ball_player) && ball_player.spectating == false) {
	node_send(buffer,"eventName","Player Update","Num",ball_player.num,"X",ball_player.x,"Y",ball_player.y,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
}

alarm[0] = 1;