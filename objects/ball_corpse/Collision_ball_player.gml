/// @description Tick index depending on team
if(global.teamNum[num] != global.teamNum[other.num]) { //be collected as a soul
	with(ball_game) {
		node_send(buffer,"eventName","Status","Target",other.num,"Status Num", 52);
	}
}