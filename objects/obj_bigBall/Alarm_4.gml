/// @description Send flying
stasis = false;
sprite_index = spr_charging;
hspeed = stasisx*.9;
vspeed = stasisy*.9;
if(speed > 50)
	speed = 50;
stasisx = 0;
stasisy = 0;