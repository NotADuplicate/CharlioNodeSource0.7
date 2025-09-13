function scr_kill(argument0, argument1) {
	if(global.game = "Pirates") {
		with(pirate_other) {
	            if(num == argument0) {
					repeat(argument1) {
						instance_create(x,y,moving_booty);
					}
	                x = -1000;
					y = -1000;
					sprite_index = spr_purple;
					if(pirate)
						global.piratecount--;
	            }
	        }
		if(global.piratecount < 1) {
			pirate_game.alarm[4] = 1;
			//global.loot = 0;
			if(instance_exists(pirate_player))
				pirate_player.alarm[9] = 45;
		}

	}
	else {
		with(obj_other) {
	            if(num == argument0) {
	                instance_destroy();
	            }
	        }
	}


}
