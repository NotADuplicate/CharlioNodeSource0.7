/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(.5)
draw_self();
if(global.teamNum[killer] == -1)
	draw_set_color(c_blue)
else
	draw_set_color(c_red)

	draw_text(x,y-35,global.names[killer]);
	draw_set_color(c_white)
	draw_sprite(spr_attack,0,x,y);
	draw_set_color(c_purple);
	draw_text(x,y+10,victim);
	draw_set_color(c_white)
	draw_set_alpha(1)