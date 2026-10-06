if(global.unlocks > 0) {
	if(!instance_exists(obj_modal)) {
		global.unlocks--;
		scr_unlock_options();
	}
	alarm[1] = 30;
}