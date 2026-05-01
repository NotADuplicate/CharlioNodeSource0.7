/// @description Face direction
image_angle = direction;
scope = global.players[num].scope
speed *= scope;
if(num == ball_player.num) {
	if(global.screenShake < 6)
		global.screenShake = 6;
}