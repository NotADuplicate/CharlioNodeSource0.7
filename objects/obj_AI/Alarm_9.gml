/// @description Send abilities selected
show_debug_message("picking loadout + gun")
scr_pick_loadout();
array_push(loadout, gunObj)
with(ball_game) {
	node_send(buffer,"eventName","Gun Picked","Gun Name",other.gunObj.name, "Num", other.num);
}