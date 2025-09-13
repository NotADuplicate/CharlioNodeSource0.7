/// @description Snap to player
xp = x;
yp = y;
visible = true
x = global.players[num].x;
y = global.players[num].y;
hspeed = (xp-x)/20;
vspeed = (yp-y)/20;
alarm[1] = 20;