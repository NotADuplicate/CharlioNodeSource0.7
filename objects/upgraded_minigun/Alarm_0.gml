/// @description Face direction
scope = global.players[num].scope
accuracy = global.players[num].accuracy
speed *= scope; 


direction += random_range(-30/accuracy,30/accuracy);
image_angle = direction;


if(num == ball_player.num) {
	if(global.screenShake < 10)
		global.screenShake++;
}