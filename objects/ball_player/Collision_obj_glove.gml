/// @description Be grabbed
if(other.num != num && spellShield == 0) {
	if(global.teamNum[num] != global.teamNum[other.num])
		global.stun = 15;
	scr_player_move(other.direction+180,4)
	global.slow = .5;
	ball_game.alarm[7] = 10;
	grabNum = other.num
	grabber = global.players[grabNum];
	ball_player.tossGrabbed = true;
		with(ball_game) {
			node_send(buffer, "eventName", "Targeted Status", "Target", other.num, "User", ball_player.num, "Status Num", 26)
		}
}