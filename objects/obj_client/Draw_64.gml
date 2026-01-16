/*if(global.ready > 0) {
	if(ready)
		draw_text_color(900,30,string_hash_to_newline(global.ready),c_green,c_green,c_green,c_green,1);
	else
		draw_text(900,30,string_hash_to_newline(global.ready));
}*/
if(loadoutPicking && loadoutPickingIndex == index && loadoutTimer < 40) {
	draw_healthbar(200,40,810,80, loadoutTimer*3.33,c_black,c_white,c_white,0,true,true);
	loadoutTimer -= delta_time / 1000000;
	if(loadoutTimer < 0) {
		alarm[7] = 1;
		loadoutTimer = 90
	}
}
if(room = room1 && global.connected)
	draw_text(500,80,"Ping:" + string(ping));

//draw_text(500,400,instance_number(obj_playerUI));