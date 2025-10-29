/// @description Catch and have player throw
if(num == ball_player.num) {
	var grabbed = other;
	scr_startThrow(grabbed.object_index, grabbed.sprite_index);
	with(ball_game) {
		node_send(buffer,"eventName","Hook Stop","Obj",grabbed.object_index,"Num",grabbed.num)
	}
}