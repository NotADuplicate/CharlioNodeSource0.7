/// @description Click on ready checkbox
if(named == global.name && point_distance(xp-64,y+20,mouse_x,mouse_y) < 30) {
	obj_client.alarm[2] = 1;
}
if(bot && point_distance(xp-130,y+39,mouse_x,mouse_y) < 20) {
	if(global.connected) {
		with(obj_client) {
			node_send(buffer,"eventName","Disconnect","Num",other.num)
		}
	} else if(global.testMode) {
		
		with(obj_playerUI) {
			if(other.num < num) {
				num--;
			}
		}
		instance_destroy();
		
	}
}