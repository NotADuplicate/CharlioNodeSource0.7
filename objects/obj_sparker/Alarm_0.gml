/// @description Show as trail to player
player = global.players[num];
visible = true;
image_alpha = 0.5;
image_angle = point_direction(x,y,player.x,player.y)
image_xscale = point_distance(x,y,player.x,player.y)/174
alarm[1] = 1;