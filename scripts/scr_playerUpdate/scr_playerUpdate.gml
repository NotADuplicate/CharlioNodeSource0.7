function scr_playerUpdate(nums, xps, yps, hps, gundirs){
	if(nums == "" || nums == undefined || xps == undefined || yps == undefined || hps == undefined || gundirs == undefined) {
		show_debug_message("Nums undefined")
		return;
	}
	
	for(i = 0; i < global.loop; i++) {
		num = (nums[| i])
		
		if(num != ball_player.num && instance_exists(global.players[num])) {
			player = global.players[num];
			player.x = (xps[| i]);
			player.y = (yps[| i]);
			player.hp = (hps[| i]);
			player.gunDir = (gundirs[| i]);
		}
	}
}