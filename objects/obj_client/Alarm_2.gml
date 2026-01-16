/// @description Toggle ready
if(global.connected = true) {
	show_debug_message("READY: ")
	show_debug_message(ready)
	
	if(ready == true)
		ready = false;
	else
		ready = true;
	
	
	node_send(buffer,"eventName","Ready","Num",index,"Ready",ready, "Loadout", "")
}