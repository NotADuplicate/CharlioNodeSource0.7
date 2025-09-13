/// @description Draw stuff
draw_rectangle_color(0,y-25,500,y+25,c_gray,c_gray,c_gray,c_gray,false);
align = draw_get_halign();
draw_set_halign(fa_left)
draw_text_ext_color(30,y,txt,15,450,c_white,c_white,c_white,c_white,1);
draw_set_halign(align)