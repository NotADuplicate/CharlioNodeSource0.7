/// @description Insert description here
// You can write your code in this editor
instance_destroy()
lighting_flash(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction),.4);
if(num == ball_player.num) {
	if(global.screenShake < 7)
		global.screenShake = 7;
}