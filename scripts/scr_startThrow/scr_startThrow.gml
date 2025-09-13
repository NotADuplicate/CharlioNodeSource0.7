// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_startThrow(obj, spr){
	global.throwRange = 1;
	global.thowItem = obj;
	ball_game.held = true;
	with(ball_game) {
		node_send(buffer, "eventName", "Throw Sprite", "Num", ball_player.num, "Sprite", spr)
	}
} 