/// @description Shift spectating
if(global.spectator) {
	linked = true;
	linkI = link.num
	linkI--;
		if(linkI < 1)
			linkI = global.loop;
	done = 5;
	while(global.players[linkI].respawnTimer > 0 && done > 0) {
		linkI--;
		done--;
		if(linkI < 1)
			linkI = global.loop;
	}
	if(done > 0)
		link = global.players[linkI];
}