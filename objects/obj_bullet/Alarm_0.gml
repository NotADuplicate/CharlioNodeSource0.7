/// @description Face direction
scope = global.players[num].scope
speed *= scope;

image_angle = direction;
if(num == ball_player.num) {
	if(global.screenShake < 4)
		global.screenShake = 4;
}