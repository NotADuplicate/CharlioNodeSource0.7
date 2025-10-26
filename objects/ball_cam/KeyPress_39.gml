/// @description Shift spectating
if(global.spectator || global.dead) {
	linked = true;
	linkI = link.num
	linkI++;
		if(linkI > global.loop)
			linkI = 1;
	done = 5;
	validPlayer = (global.players[linkI].respawnTimer <= 0 && (global.spectator || global.players[linkI].team == ball_player.team))
	while(!validPlayer && done > 0) {
		linkI++;
		done--;
		if(linkI > global.loop)
			linkI = 1;
	}
	if(done > 0)
		link = global.players[linkI];
}