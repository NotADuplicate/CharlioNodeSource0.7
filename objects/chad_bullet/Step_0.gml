/// @description Slow and fade
if(visible) {
	speed -= slow * global.players[num].scope;
	image_alpha -= slow/40;
	if(speed < 3) 
	    instance_destroy();
}