//if(global.connected == false) {
if(!obj_client.loadoutPicking) {
	global.team = 50;
	global.teamside = -1;
	if(global.connected)
		obj_client.alarm[6] = 1;
}
/*if(global.spectator == false ) {//&& global.connected == true) {
	if(global.teamside && global.connected = true) {
		scr_endTeam(obj_client.buffer,obj_client.socket) //this line might cause an illegal buffer index error!
		obj_client.alarm[6] = 1;
	}
}
	global.team = 50;
	global.teamside = false;
//}