///Lock door and prepare escape
//if(global.gen > 1)	{
	escaping = true;
	if(other.pirate) {
		crew = false
	}
//}
/*else {
	scr_text(1,"Escape pod requires 2 generators to function");
}


///If player is a pirate, end game
/*if(other.pirate) {
	pirate_game.alarm[4] = 1;
	instance_destroy();
}*/