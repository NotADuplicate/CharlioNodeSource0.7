/// @description Guess
	var guess = string_lower(get_string("What is the other team's word?","Guess"));
		if(guess == string_lower(global.word[global.hidden])) {
			alarm[4] = 1; //win
		}
		else {
			alarm[5] = 1; //maybe lose
		}