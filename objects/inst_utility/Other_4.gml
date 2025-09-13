/// @description Handle decimals
order = 0;
if(global.gameMode == "Royale") {
	if(random_range(0,1) > .6) {
		ins = instance_find(royale_abilitySpawn,id mod instance_number(royale_abilitySpawn))
		x = ins.x;
		y = ins.y;
		if(place_meeting(x,y,inst_utility))
			instance_destroy()
	}
}

drawOnce = 0;
depth = -1;