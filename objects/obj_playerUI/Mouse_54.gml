/// @description Click on ready checkbox
if(named == global.name && point_distance(xp-64,y+20,mouse_x,mouse_y) < 30) {
	obj_client.ready = false
	obj_client.alarm[2] = 1;
}