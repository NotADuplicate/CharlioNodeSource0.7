/// @description Face direction
image_angle = direction;
visible = true;
scope = global.players[num].scope
speed = 30*scope;
if(num == ball_player.num) {
	if(global.screenShake < 10)
		global.screenShake = 10;
}