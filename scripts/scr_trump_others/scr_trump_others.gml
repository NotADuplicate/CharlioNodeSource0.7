function scr_trump_others(argument0, argument1, argument2) {
	with(trump_other) {
		if(num == argument0) {
			x = argument1;
			y = argument2;
			if(instance_exists(trump_player) && x == trump_player.x && y = trump_player.y) { //get killed
				trump_game.alarm[0] = 1;
			}
		}
	}


}
