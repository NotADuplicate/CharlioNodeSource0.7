/// @description Shift spectating
if(global.spectator || global.dead) {
	linked = true;
	if(link == self)
		link = 0;
	else if(variable_instance_exists(link,"num"))
		linkI = link.num
	else
		link = 0;
	if(linkI == 100)
		linkI = 1;
	else if(linkI >= global.loop)
		linkI = 100;
	else
		linkI++;
	done = 5;
	validPlayer = linkI == 100 || (global.players[linkI].respawnTimer <= 0 && (global.spectator || global.players[linkI].team == ball_player.team))
	while(!validPlayer && done > 0) {
		linkI++;
		done--;
		if(linkI > global.loop)
			linkI = 100;
		validPlayer = linkI == 100 || (global.players[linkI].respawnTimer <= 0 && (global.spectator || global.players[linkI].team == ball_player.team))
	}
	if(linkI == 100) {
		link = obj_bigBall;
	} else if(done > 0) {
		link = global.players[linkI];
	}
}