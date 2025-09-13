/// @description Latch onto it
if(other.spellShield) 
	instance_destroy();
else if(hooked == 0) {
	hooked = obj_bigBall;
	alarm[0] = 120;
}