/// @description Get splashed with oil
if(spellShield == 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 19)
		}
}