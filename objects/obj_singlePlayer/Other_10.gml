/// @description Get the client to connect	
instance_create(533,667,obj_disconnect);
with(inst_menuButton) {
	x -= 500;
}
global.testMode = true;
obj_client.socket = network_create_socket(network_socket_ws)
obj_client.pingSet = current_time;
with(obj_client) {
	node_send(buffer,"eventName", "Num", "Number", 1, "Mode", "Ball");
	node_send(buffer,"eventName","Player UI", "Number", 1, "Team", -1, "Ready", false, "Name", global.name, "Loadout", ds_list_create(), "Bot", false);
}

	
global.connected = false;