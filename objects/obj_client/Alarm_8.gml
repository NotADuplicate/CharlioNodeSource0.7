/// @description Initialize Client
if(triedConnect)
	global.serverip = get_string("IP adress:", "jazure.net");
else {
	global.serverip = "jazure.net";
	triedConnect = true;
}
socket = network_create_socket(network_socket_udp)
var spec = global.spectator;
global.spectator = false;
node_send(buffer,"eventName","Get Lobbies","spectator",spec);
global.spectator = spec;
global.spectating = spec;
if(spec)
	index = 0;


	show_debug_message("Client tries to connect")
pingSet = current_time;
message = "penis";
	global.connected = false;