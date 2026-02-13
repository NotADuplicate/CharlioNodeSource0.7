/// @description Tick index depending on team
if(global.teamNum[num] != global.teamNum[other.num]) { //be collected as a soul
	scr_ball_sound(snd_monsterBuff,x,y);
	if(global.gameMode == "Rumble") {
		global.ammo = global.maxAmmo;
	}
	with(ball_game) {
		node_send(buffer,"eventName","Status","Target",other.num,"Status Num", 52);
	}
}