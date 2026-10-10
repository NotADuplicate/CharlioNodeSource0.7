/// @description Toggle ready
if(global.connected = true) {
	if(activeGame) {
		node_send(buffer, "eventName","Join Active Game", "Num", index);
		activeGame = false;
	} else {	
		if(ready == true)
			ready = false;
		else
			ready = true;

		node_send(buffer,"eventName","Ready","Num",index,"Ready",ready, "Loadout", "")
	}
} else if(global.testMode) {
	if(statsReady) {
		var matches = steam_get_stat_int("offline_matches");
		steam_set_stat_int("offline_matches", matches+1);
		obj_client.steamUpdate = true;
	}
	global.loop = instance_number(obj_playerUI);
	instance_create(0,0,solo_server)
	with(obj_playerUI) {
		global.teamNum[num] = team;
		global.names[num] = named;
	}

	global.ammo = 0;
	global.playBall = false;
	global.ready = 0;
	obj_client.ready = false;
	global.mons = 21;
	i = 0;
	repeat(10) {
		global.players[i] = self;
		i++;
	}
	if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	    instance_destroy(inst_game);
	}
	global.gameMode = "Simple"
	ins = instance_create_depth(0,0,-1000,ball_game);
			
	room_goto(demo_room);
			
	ins.alarm[3] = 1;
	ins.loop = global.loop;
	obj_client.index = 1
	random_set_seed(1)
	global.abilityNum = 1//buffer_read(buffer,buffer_u8)/100;
	global.leveled = 3
	global.cSwitch = true//buffer_read(buffer,buffer_bool);
	global.teaming = true//buffer_read(buffer,buffer_bool);
}