/// @description Decide side
if(side == -1) {
	path_start(Path2,4,path_action_stop,true)
	sprite_index = spr_blueCreep;
}
else if(side == 1) {
	path_start(Path2,-4,path_action_stop,true)
	path_position = 1;
	sprite_index = spr_redCreep
}