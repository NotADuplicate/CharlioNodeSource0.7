/// @description Save the current loadout
ini_open("Ball.sav");
if(str == "Save") {
	for(i = 0; i < 8; i++) {
		ini_write_string("Save1", "Loadout" + string(global.selectedLoadout) + string(i),global.loadoutSet[global.selectedLoadout][i].abilityName);
	}
	ini_write_string("Save1", "Loadout" + string(global.selectedLoadout) + string(8),scr_gun_name(global.loadoutSet[global.selectedLoadout][8]));
	ini_write_string("Save1", "Loadout" + string(global.selectedLoadout) + string(9),scr_gun_name(global.loadoutSet[global.selectedLoadout][9]));
} else { //load
	j = 0;
	while(j < 8) {
		loadoutSlot = ini_read_string("Save1", "Loadout" + string(global.selectedLoadout) + string(j),"");
		if(loadoutSlot != "") {
			slot = variable_instance_get(Abilities,loadoutSlot)
			if(slot != undefined) {
				global.loadoutSet[global.selectedLoadout][j] = slot
			}
		}
		j++;
	}
	gun1 = ini_read_string("Save1", "Loadout" + string(global.selectedLoadout) + string(8), "")
	if(gun1 != "")
		global.loadoutSet[global.selectedLoadout][8] = scr_name_to_gun(gun1);
	gun2 = ini_read_string("Save1", "Loadout" + string(global.selectedLoadout) + string(9), "")
	if(gun1 != "")
		global.loadoutSet[global.selectedLoadout][9] = scr_name_to_gun(gun2);
}
ini_close();