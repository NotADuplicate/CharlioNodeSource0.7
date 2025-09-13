/// @description Set vars
stasis = false;
stasisx = 0;
stasisy = 0;
startX = x;
startY = y;
num = 100;
murderball = false;
layer = layer_create(-1000);
spellShield = 0;
moved = false;
alarm[0] = 1;
alarm[7] = 600;
frost = 0;
oil = 0;
melee = 0;
inversion = 0;
drone = 0;
droneAmmo = 0;
lastTouched = 0;

instance_create(x,y,obj_ballGhost);