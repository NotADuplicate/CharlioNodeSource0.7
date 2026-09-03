/// @description Click on ready checkbox
if(named == global.name && point_distance(xp-64,y+20,mouse_x,mouse_y) < 30) {
	obj_client.alarm[2] = 1;
}
if(bot && point_distance(xp-130,y+39,mouse_x,mouse_y) < 20) {
	with(obj_client) {
		node_send(buffer,"eventName","Disconnect","Num",other.num)
	}
}