/// @description Get splashed with oil
if(spellShield == 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",100,"Status Num", 19)
		}
}