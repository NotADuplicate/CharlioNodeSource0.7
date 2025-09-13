///Escape after colliding twice
if(escaping) {
	if(other.pirate == false) {
		global.alive = crew;
	}
	instance_destroy(other);
	global.ship = false;
}