/// @description 
num = 0;
alarm[1] = 1; //set to player
image_xscale = 0.5;
image_yscale = 0.5;

hp = 100;
maxhp = 100;
if(point_distance(x,y,ball_player.x,ball_player.y) < 200) {
	inside = true;
}
else
	inside = false;