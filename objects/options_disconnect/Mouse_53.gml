/// @description Get the client to connect
if(global.options && global.optionState == "General") {
	xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
	yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	//instance_create(xp,yp,obj_dashing);
	if(mouse_x > xp-32 && mouse_x < xp + 32 && mouse_y > yp-16 && mouse_y < yp+16) { //actually be clicked
		global.testMode = false;
		with(obj_tutorial) {
			instance_destroy();
		}
		obj_client.alarm[9] = 1;
		if(instance_exists(inst_game))
			instance_destroy(inst_game)
		room_goto(room1);
	}
}