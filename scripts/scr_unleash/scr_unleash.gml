function scr_unleash() {
	with(pirate_other) {
		if(beast) {
			sprite_index = spr_beast;
		}
	}


	if(instance_exists(pirate_player)) {
		if(pirate_player.beast) {
			pirate_player.sprite_index = spr_beast;
		}
	}


}
