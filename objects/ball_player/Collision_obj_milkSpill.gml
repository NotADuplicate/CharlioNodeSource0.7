/// @description Get milked
with(ball_game) {
	node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 32)
}
scr_cleanse();