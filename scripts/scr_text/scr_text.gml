function scr_text(argument0, argument1) {
	priority = argument0;
	txt = argument1;
	if(priority > pirate_game.priority) {
		pirate_game.priority = priority;
		pirate_game.txt = txt;
		pirate_game.alarm[0] = 120;
	}


}
