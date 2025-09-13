draw_sprite_ext(spr_gun,0,x,y,1,1,pointing,c_white,1)
draw_self();
draw_text(x,y-40,string_hash_to_newline(global.names[num]));