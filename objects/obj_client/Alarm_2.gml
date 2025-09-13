/// @description Toggle ready
if(global.connected = true) {
	show_debug_message("READY: ")
	show_debug_message(ready)
	
	if(ready == true)
		ready = false;
	else
		ready = true;
	
	
	if(ready && global.gameMode == "Comp") { //send loadout
		loadout = []
		for(i = 0; i <8; i++) {
			loadout[i] = (global.loadoutSet[global.selectedLoadout][i].sprite)
		}
		loadout[8] = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][8])
		loadout[9] = scr_gun_sprite(global.loadoutSet[global.selectedLoadout][9])

		node_send(buffer,"eventName","Ready","Num",index,"Ready",ready, "Loadout", loadout)
	}
	else {
		node_send(buffer,"eventName","Ready","Num",index,"Ready",ready, "Loadout", "")
	}
}