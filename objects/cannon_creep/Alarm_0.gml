/// @description Decide side
if(side == -1) {
	hspeed = 2;
	sprite_index = spr_blueCreep;
}
else if(side == 1) {
	hspeed = -2;
	x = 5000;
	sprite_index = spr_redCreep
	image_xscale = -1.5;
}