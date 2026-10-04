if(hovering && global.options == false) {
	if(global.connected) {
		with(obj_client) {
			botName = choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer")
			node_send(buffer, "eventName", "Connect", "lobbyIndex", global.lobby, "spectator", false, "bot", true, "Name", botName, "Team", other.team);
		}
	} else if(global.testMode) {
		num = instance_number(obj_playerUI)+1
		with(obj_client) {
			botName = choose("Nerd","Fool","Chief","Bro","Homie","King","Homeslice","Dude","Gamer")
			node_send(buffer,"eventName","Player UI", "Number", other.num, "Team", other.team, "Ready", true, "Name", botName, "Loadout", ds_list_create(), "Bot", true);
		}
	}
}