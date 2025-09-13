/// @description Kill all others and player to reset game
//alarm[1] = 3

global.playBall = true;
instance_create(0,0,obj_junglePass);
    if(instance_exists(ball_player)) {
        with(ball_other) {
            instance_destroy();
        }
        with(obj_star) {
            instance_destroy();
        }
        instance_destroy(ball_player);
    }
    
instance_create(0,0,obj_UI)
	
if(global.abilityNum < 90) {
	global.abilityNum = round(global.abilityNum*instance_number(inst_utility))
	while(instance_number(inst_utility) > global.abilityNum) {
		instance_destroy(instance_find(inst_utility,irandom_range(0,instance_number(inst_utility)-1)))
	}
}
    //Make new player and others
    //loop = buffer_read(buffer,buffer_u8);
    //index = buffer_read(buffer,buffer_u8);
    //random_set_seed(buffer_read(buffer,buffer_u8));
	var i = 1;
	instance_create(0,0,ball_cam)
	leftLoadoutY = 80//4338
	rightLoadoutY = 80//4338
	global.loop = loop
    repeat(loop) {
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
				load = instance_create(40/*3225*/,leftLoadoutY,obj_loadout);
				load.num = obj_client.index;
		}
		else {
			if(global.teamNum[i] == -1) { //left side
				load = instance_create(40,leftLoadoutY,obj_loadout);
				load.num = i;
				leftLoadoutY += 180;
			}
			else if(global.teamNum[i] == 1){
				load = instance_create(860,rightLoadoutY,obj_loadout);
				load.num = i;
				rightLoadoutY += 180;
			}
		}
		//if(global.teaming == 0 || global.teamNum[i] != 0) {
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
		//}
		i++;
	}
if(global.spectator) { //make fake player ig
	obj_client.index = 0;
	ins = instance_create(0,0,ball_player);
	ins.num = 0;
	ins.spectating = true;
}
global.players[100] = obj_bigBall
global.ballStart = true;


var i = 0;
/*repeat(9) {
	statList[i] = ds_list_create()
	with(inst_utility) { //add all the stats to the list
		if(scr_statFind(i,-1) != 0) {
			scr_statFind(i,scr_statFind(i,-1)+random_range(-.3,.3))
			ds_list_add(other.statList[i],scr_statFind(i,-1))
		}
	}
	
	ds_list_sort(statList[i],true) //sort
	with(inst_utility) { //set new stats to the order of the list
		if(scr_statFind(i,-1) != 0) {
			statOrder[i] = ds_list_find_index(other.statList[i],scr_statFind(i,-1))
		}
	}
	i++;
}

//instance_create(0,0,obj_music)