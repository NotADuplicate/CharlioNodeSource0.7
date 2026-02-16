/// @description Draw stuff
color = global.teamNum[num] == -1 ? c_blue : c_maroon;
if(global.chatEnabled) {
	draw_set_alpha(0.5)
	draw_rectangle_color(0,y-35,500,y+25,c_gray,c_gray,c_gray,c_gray,false);
	align = draw_get_halign();
	draw_set_halign(fa_left)
	draw_text_transformed_color(20,y-32,global.names[num],1.5,1.5,0,color,color,color,color,1);
	draw_text_ext_color(30,y,txt,15,450,c_white,c_white,c_white,c_white,1);
	draw_set_halign(align)
	draw_set_alpha(1)
}