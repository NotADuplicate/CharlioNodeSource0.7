/// @description Send flying
stasis = false;
	if(global.teamNum[num] == 1)
		sprite_index = spr_red;
	else
		sprite_index = spr_blue;
hspeed = stasisx;
vspeed = stasisy;
if(speed > 50)
	speed = 50;
stasisx = 0;
stasisy = 0;