if(global.ready > 0) {
	if(ready)
		draw_text_color(900,30,string_hash_to_newline(global.ready),c_green,c_green,c_green,c_green,1);
	else
		draw_text(900,30,string_hash_to_newline(global.ready));
}
if(room = room1 && global.connected)
	draw_text(500,80,"Ping:" + string(ping));

//draw_text(500,400,instance_number(obj_playerUI));