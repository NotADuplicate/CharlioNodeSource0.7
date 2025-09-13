/// @description get faster regen
with(ball_game) {
	node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",29)
}
instance_destroy();
ball_game.spongeable = true;