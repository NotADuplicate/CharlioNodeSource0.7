//if(global.connected == false) {
if(!obj_client.loadoutPicking) {
	global.team = 50;
	global.teamside = -1;
	if(global.connected)
		obj_client.alarm[6] = 1;
	if(global.testMode) {
		with(obj_client) {
		node_send(buffer,"eventName","Player UI", "Number", 1, "Team", -1, "Ready", false, "Name", global.name, "Loadout", ds_list_create(), "Bot", false);
		}
	}
}