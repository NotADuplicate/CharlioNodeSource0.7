/// @description Insert description here
// You can write your code in this editor
if(damager != 0) {
	draw_set_alpha(.5)
	draw_self();
	if(global.teamNum[damager] == -1)
		draw_set_color(c_blue)
	else
	draw_set_color(c_red)
	draw_text(x,y-35,global.names[damager]);
	draw_set_color(c_white)
	if(icon == 0)
		draw_sprite(spr_attack,0,x,y);
	else
		draw_sprite(icon,0,x,y);
	draw_text(x,y+10,amount);
}