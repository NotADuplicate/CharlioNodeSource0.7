/// @description Set vars
stasis = false;
stasisx = 0;
stasisy = 0;
startX = x;
startY = y;
num = 100;
global.aiControl[num] = false;
murderball = false;
layer = layer_create(-1000);
spellShield = 0;
moved = false;
xspd = 0;
yspd = 0;
alarm[0] = 1;
alarm[7] = 600;
frost = 0;
oil = 0;
melee = 0;
inversion = 0;
drone = 0;
droneAmmo = 0;
lastTouched = 0;
fric = 0.4;
radius = 32;
alarm[10] = 30 * 30
ballHistory = [];

instance_create(x,y,obj_ballGhost);