/// @description Face direction
scope = global.players[num].scope
accuracy = global.players[num].accuracy
direction += random_range(-30/accuracy,30/accuracy);
image_angle = direction;
speed *= scope;

if(num == ball_player.num) {
	if(global.screenShake < 7)
		global.screenShake++;
}