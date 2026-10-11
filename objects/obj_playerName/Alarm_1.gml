sameTeam = global.teamNum[link.num] == global.teamNum[ball_player.num] || global.spectator;

if(!sameTeam) {
	alarm[0] = 90;
}