//if(global.connected == false) {
global.spectator = true;
global.team = 950;
global.teamside = 0;
if(global.connected)
	obj_client.alarm[6] = 1;
	/*global.team = 950;
	if(global.teamside == false && global.connected == true) {
		scr_endTeam(obj_client.buffer,obj_client.socket) //this line might cause an illegal buffer index error!
		obj_client.alarm[6] = 1;
	}
	global.teamside = true;

//}