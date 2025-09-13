function scr_endTurn() {
	if(instance_exists(trump_player)) {
		trump_player.turn = false;
	}
	instance_create(350,60,confirm_turn);
	instance_create(650,60,cancel_turn);


}
