if(global.unlocks > 0) {
	global.newPlayer = false;
	scr_save_options();
	if(!instance_exists(obj_modal)) {
		global.unlocks--;
		scr_unlock_options();
	}
	alarm[1] = 30;
}