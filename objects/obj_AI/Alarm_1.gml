/// @description Create link player
if(global.testMode) {
	scr_createBallPlayer(num);
}
show_debug_message("Creating link:")
show_debug_message(object_get_name(global.players[num].object_index))
link = global.players[num];


scr_pick_enemy();
tower = scr_pick_tower(false);

alarm[9] = 2;