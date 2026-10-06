if(instance_exists(obj_tutorial)) { return; }

if(obj_drag.dead && obj_drag.timer <= 0) {
	with(obj_drag) {
		image_alpha = 1;
		alarm[0] = 1;
	}
}
alarm[2] = 30;