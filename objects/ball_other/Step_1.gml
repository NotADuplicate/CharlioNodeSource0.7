/// @description Respawn timer and xscale
if(respawnTimer > 0 && instance_exists(obj_ending) == false) {
	respawnTimer -= (delta_time/1000000);
	if(respawnTimer < 0.5) {
		respawnTimer = 0;
		//reset damage stats
		atk = 1;
		pwr = 1;
		var j = 4
		show_debug_message("Other respawning")
		while(j <= global.loadoutSize[num] && j < 20) {
			show_debug_message(global.loadout[num,j])
			if(global.loadout[num,j] == spr_attack) { atk *= 1.2; }
			if(global.loadout[num,j] == spr_wand) { pwr *= 1.2; }
			j++;
		}
	}
}

if(gunDir > 90 && gunDir < 270){
	walkDirection = -2*scale;
}
else
	walkDirection = 2*scale;
	
image_xscale = walkDirection