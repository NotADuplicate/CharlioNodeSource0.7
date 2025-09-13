///Lock door when escaping
if(locking) {
	with(other) {
		in = instance_create(x,y,locked_door);
		in.image_angle = image_angle;
		instance_destroy();
	}
}