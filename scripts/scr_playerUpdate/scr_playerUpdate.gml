function scr_playerUpdate(players){	
	var j = 0;
	var num = 0;
	var dt = delta_time / 35000;
	while(j < ds_list_size(players)) {
		num = players[| j][? "n"];
		show_debug_message(num)
		show_debug_message(array_length(global.players))
		
		if(num != ball_player.num && array_length(global.players) > num) {
			player = global.players[num];
			if(players[| j][? "X"] != undefined) { player.x = players[| j][? "X"]; }
			if(players[| j][? "Y"] != undefined) { player.y = players[| j][? "Y"]; }
			if(players[| j][? "hp"] != undefined) { player.hp = players[| j][? "hp"]; }
			if(players[| j][? "dir"] != undefined) { player.gunDir = players[| j][? "dir"]; }
			if(!global.spectator) {
				if(players[| j][? "Xspd"] != undefined) { 
					player.xspd = players[| j][? "Xspd"]; 
					player.movementPrediction = 0;
				}
				if(players[| j][? "Yspd"] != undefined) {
					player.y = players[| j][? "Yspd"]; 
					player.movementPrediction = 0;
				}	
				if(player.movementPrediction > 0) {
					with(player) {
						x += xspd*movementPrediction*dt * obj_client.ping/33;
						y += yspd*movementPrediction*dt * obj_client.ping/33;
					}
				}
			}
		}
		j++;
	}
}