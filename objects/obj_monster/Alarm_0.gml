/// @description Respawn
image_alpha += .1;

if(image_alpha > .5) {
	dead = false
	x = xpos;
	y = ypos;
	camp.image_alpha = 1;
	hp = maxhp
	enraged = false;
}
else
	alarm[0] = 90;