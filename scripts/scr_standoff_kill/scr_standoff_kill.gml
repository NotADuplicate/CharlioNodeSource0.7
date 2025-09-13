function scr_standoff_kill(argument0) {
		with(standoff_other) {
	        if(num == argument0) {
				alarm[1] = 10;
				sprite_index = dead_cowboy;
	        }
		}


}
