/// @description Stop if far away from player
if(visible && point_distance(x,y,global.players[num].x,global.players[num].y) > 65)
	instance_destroy();