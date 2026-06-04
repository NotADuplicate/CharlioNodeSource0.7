/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(.5)
draw_self();
if(global.teamNum[killer] == -1)
	draw_set_color(c_blue)
else
	draw_set_color(c_red)
if(suicide) {
	draw_text(x,y-40,global.names[killer]);
	if(assister > 0)
		draw_text_transformed(x,y-25,global.names[killer],0.75,0.75,0);
	draw_set_color(c_white)
	if(icon != 0)
		draw_sprite(icon,0,x-26,y+12)
	draw_sprite(spr_skull,0,x+26,y+12)
}
else {
	draw_text(x,y-45,global.names[killer]);
	if(assister > 0)
		draw_text_transformed(x,y-25,global.names[assister],0.75,0.75,0);
	draw_set_color(c_white)
	if(icon == 0)
		draw_sprite(spr_attack,0,x+8,y);
	else
		draw_sprite(icon,0,x+8,y);
	if(global.teamNum[victim] == -1)
		draw_set_color(c_blue)
	else
		draw_set_color(c_red)
	draw_text(x,y+18,global.names[victim]);
	draw_set_color(c_white)
}
	draw_set_alpha(1)