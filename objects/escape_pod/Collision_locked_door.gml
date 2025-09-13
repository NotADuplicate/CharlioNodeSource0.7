///Lock door when escaping
if(locking == false) {
	with(other) {
		in = instance_create(x,y,obj_door);
		in.image_angle = image_angle;
		instance_destroy();
	}
}