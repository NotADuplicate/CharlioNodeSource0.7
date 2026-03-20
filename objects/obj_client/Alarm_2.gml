/// @description Toggle ready
if(global.connected = true) {
	if(activeGame) {
		node_send(buffer, "eventName","Join Active Game", "Num", index);
		activeGame = false;
	}
	show_debug_message("READY: ")
	show_debug_message(ready)
	
	if(ready == true)
		ready = false;
	else
		ready = true;
	
	
	node_send(buffer,"eventName","Ready","Num",index,"Ready",ready, "Loadout", "")
}