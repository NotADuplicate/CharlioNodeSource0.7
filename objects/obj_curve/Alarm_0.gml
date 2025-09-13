/// @description Flip the players gun around
with(obj_gun) {
	if(num == other.num) {
		clockwise = !clockwise
	}
}

if(direction > 360) {
	curving = -1;
}
alarm[2] = 1;

