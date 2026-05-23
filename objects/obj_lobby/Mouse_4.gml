/// @description Connect to lobby
with(obj_client) {
	node_send(buffer, "eventName", "Connect", "lobbyIndex", other.lobbyNum, "spectator", global.spectator)
}
with(obj_lobby) {
	instance_destroy();
}