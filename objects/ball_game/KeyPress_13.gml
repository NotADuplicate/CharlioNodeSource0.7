/// @description Start typing
if(global.typing) {
	global.typing = false;
	if(keyboard_string != "")
		node_send(buffer, "eventName","Message","Num",ball_player.num,"Message",keyboard_string)
}
else {
	global.typing = true;
	keyboard_string = ""
}