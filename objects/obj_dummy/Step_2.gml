/// @description Statuses
if(drowsy  > 0) {
	drowsy--;
	if(drowsy mod 10 == 0) {
		instance_create(x,y,obj_Z)
		if(drowsy == 0) {
			sleeping = 150;
		}
	}
}
if(sleeping > 0) {
	sleeping--;
	if(sleeping mod 8 == 0) {
		instance_create(x,y,obj_Z)
	}
}