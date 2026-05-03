/// @description Face direction
scope = global.players[num].scope
speed *= scope;
image_angle = direction;
if(num == ball_player.num) {
	if(global.screenShake < 12)
		global.screenShake = 12;
}
scr_ball_sound(snd_charge,x,y)