/// @description drip
yOffset += 1;
x = global.players[num].x+xOffset;
y = global.players[num].y+yOffset
if(image_alpha > 0.1)
	image_alpha -= 0.05;
else
	instance_destroy()