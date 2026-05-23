if(active && global.teamNum[num] != global.teamNum[other.num] && other.spellShield == 0) {
	active = false;
	other.bleedNum = num;
	if(other.bleed == 0) {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 61)
		}
	} else {
		other.bleed = 120;
	}
	
}