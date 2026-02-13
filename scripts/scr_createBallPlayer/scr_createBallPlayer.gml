function scr_createBallPlayer(i){
	global.loadoutSize[i] = 4;
	global.deaths[i] = 0;
	global.kills[i] = 0;
	n = 0;
	repeat(5) {
		global.loadout[i,n] = 0;
		global.knownLoadout[i,n] = 0;
		n++;
	}
		
	//make loadouts
	if(global.gameMode == "Royale") {
			load = instance_create(40/*3225*/,ball_game.leftLoadoutY,obj_loadout);
			load.num = obj_client.index;
	}
	else {
		if(global.teamNum[i] == -1) { //left side
			load = instance_create(40,ball_game.leftLoadoutY,obj_loadout);
			load.num = i;
			ball_game.leftLoadoutY += 180;
		}
		else if(global.teamNum[i] == 1){
			load = instance_create(860,ball_game.rightLoadoutY,obj_loadout);
			load.num = i;
			ball_game.rightLoadoutY += 180;
		}
	}
	if(i == obj_client.index) {
		ins = instance_create(0,0,ball_player);
		ins.num = i;
		global.players[i] = ins
		if(global.teamNum[i] == 0)
			ins.spectating = true;
	}
	else {
		ins = instance_create(0,0,ball_other);
		ins.num = i;
		global.players[i] = ins
		if(global.teamNum[i] != 0) {
			ins.spectating = true;
		}
	}
}