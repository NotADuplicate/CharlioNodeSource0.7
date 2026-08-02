/// @description Get the client to connect
if(global.options == false) {
	with(obj_client) {
		botName = choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer")
		node_send(buffer, "eventName", "Connect", "lobbyIndex", global.lobby, "spectator", false, "bot", true, "Name", botName, "Team", -1);
	}
}