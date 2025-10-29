/// @description Snap to player
xp = x;
yp = y;
visible = true
x = global.players[num].x;
y = global.players[num].y;
hspeed = (xp-x)/throwSpd;
vspeed = (yp-y)/throwSpd;
alarm[1] = throwSpd;
//upSpd = grav*throwSpd/2;
grav = upSpd * 2/throwSpd