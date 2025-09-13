function scr_CNN_other(argument0, argument1, argument2) {
	with(player_CNN) {
		if(num == argument0) {
			instance_create(x,y,obj_tile);
			x = argument1;
			y = argument2;
		}
	}


}
