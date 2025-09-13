/// @description Snap to player
throwSpd = 15;
xp = x;
yp = y;
visible = true
x = global.players[num].x;
y = global.players[num].y;
hspeed = (xp-x)/throwSpd;
vspeed = (yp-y)/throwSpd;
alarm[1] = throwSpd;
grav = upSpd * 2/throwSpd