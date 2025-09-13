/// @description Send Swap
if(other.num != num && global.players[other.num].x > 10) {
	with(ball_game) {
		node_send(buffer,"eventName","Swap","Num",obj_swap.num,"X",ball_player.x,"Y",ball_player.y)
	}
	x = global.players[other.num].x;
	y = global.players[other.num].y;
}