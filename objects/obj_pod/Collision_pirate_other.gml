///Lock door and prepare escape
//if(global.gen > 1)	{
	escaping = true;
	if(other.pirate) {
		crew = false
	}
//}



///If player is a pirate, end game
/*if(other.pirate) {
	pirate_game.alarm[4] = 1;
	instance_destroy();
}*/