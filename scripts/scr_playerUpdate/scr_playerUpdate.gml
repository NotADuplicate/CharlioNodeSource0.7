function scr_playerUpdate(players){	
	var j = 0;
	var num = 0;
	while(j < ds_list_size(players)) {
		num = players[| j][? "n"];
		
		if(num != ball_player.num && array_length(global.players) > num) {
			player = global.players[num];
			if(players[| j][? "X"] != undefined) { player.x = players[| j][? "X"]; }
			if(players[| j][? "Y"] != undefined) { player.y = players[| j][? "Y"]; }
			if(players[| j][? "hp"] != undefined) { player.hp = players[| j][? "hp"]; }
			if(players[| j][? "dir"] != undefined) { player.gunDir = players[| j][? "dir"]; }
		}
		j++;
	}
}