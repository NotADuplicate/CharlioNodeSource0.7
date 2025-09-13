///Get picked up by pirates
if(other.pirate == true && other.beast == false) {
	instance_destroy(self);
	global.loot++;
}
/*else if(keyboard_check(ord("E"))) {
	instance_destroy(self);
	global.loot++;
	scr_gainloot(x,y);
}