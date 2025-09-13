/// @description Guess (and kill)
if(instance_exists(standoff_player) && global.bandit) {
	standoff_player.alarm[2] = 1;
	alarm[2] = 1;
	alarm[1] = 3;
}
