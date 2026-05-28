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
		linkI = global.loop;
	else if(linkI <= 1)
		linkI = 100;
	else
		linkI--;
	done = 5;
	show_debug_message("LinkI:")
	show_debug_message(linkI)
	validPlayer = linkI == 100 || (global.players[linkI].respawnTimer <= 0 && (global.spectator || (linkI <= global.loop && global.teamNum[linkI] == ball_player.team)))
	while(!validPlayer && done > 0) {
		linkI--;
		done--;
		if(linkI < 1)
			linkI = 100;
		else if(linkI == 100)
			linkI = global.loop;
		validPlayer = linkI == 100 || (global.players[linkI].respawnTimer <= 0 && (global.spectator || (linkI <= global.loop && global.teamNum[linkI] == ball_player.team)))
	}
	if(linkI == 100) {
		link = obj_bigBall;
	} else if(done > 0) {
		link = global.players[linkI];
	}
}