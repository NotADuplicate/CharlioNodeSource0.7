/// @description Snap to player
xp = x;
visible = true
x = global.players[num].x;
x += lengthdir_x(24,direction);
y += lengthdir_y(24,direction);
speed = 26;
alarm[1] = round(xp/3)