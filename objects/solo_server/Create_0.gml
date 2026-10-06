/// @description Set text
if(!instance_exists(obj_tutorial)) {
	alarm[4] = 1;
	global.levels = 3;
	alarm[2] = 2; //respawn the ref
	global.spectating = false;
}

global.xp2 = 0;
global.xpMax2 = 1500;