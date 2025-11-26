/// @description Connect to lobby
with(obj_client) {
	node_send(buffer, "eventName", "Connect", "lobbyIndex", other.lobbyNum)
}
with(obj_lobby) {
	instance_destroy();
}