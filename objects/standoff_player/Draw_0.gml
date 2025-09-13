/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_gun,0,x,y,1,1,point_direction(x,y,obj_reticle.x,obj_reticle.y),c_white,1)
draw_self();
draw_text(x,y-40,string_hash_to_newline(global.names[num]));