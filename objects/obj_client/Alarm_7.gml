/// Send loadout when selecting for comp
if(global.gameMode == "Comp" && loadoutPicking && loadoutPickingIndex == index) { //send loadout
	loadout = []
	for(i = 0; i <8; i++) {
		loadout[i] = (global.loadoutSet[global.selectedLoadout][i].abilityIndex)
	}
	loadout[8] = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][8])
	loadout[9] = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][9])

	node_send(buffer,"eventName","Loadout Picked","Num",index, "Loadout", loadout)
}