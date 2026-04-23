/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(.5)
draw_self();
	draw_set_color(c_purple);
	if(jungleWall) 
		draw_text(x,y-15,"Jungle path \n has opened");
	else if(drag)
		draw_text(x,y,"Dragon Spawned");
	else
		draw_text(x,y,"Garren Spawned");
	draw_set_color(c_white)
	draw_set_alpha(1)