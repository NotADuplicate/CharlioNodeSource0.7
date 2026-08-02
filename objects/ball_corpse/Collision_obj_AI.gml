/// @description Tick index depending on team
if(global.teamNum[num] != global.teamNum[other.num]) { //be collected as a soul
	if(global.gameMode == "Rumble") {
		global.ammo = global.maxAmmo;
	}
	var soulNum = other.num
	with(ball_game) {
		node_send(buffer,"eventName","Collect Soul","Target",other.num,"Collector", soulNum);
	}
}