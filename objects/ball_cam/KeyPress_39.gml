/// @description Shift spectating
if(global.spectator) {
	linked = true;
	linkI = link.num
	linkI++;
		if(linkI > global.loop)
			linkI = 1;
	done = 5;
	while(global.players[linkI].respawnTimer > 0 && done > 0) {
		linkI++;
		done--;
		if(linkI > global.loop)
			linkI = 1;
	}
	if(done > 0)
		link = global.players[linkI];
}