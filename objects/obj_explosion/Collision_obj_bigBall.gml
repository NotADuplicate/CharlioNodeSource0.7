/// @description Insert description here
// You can write your code in this editor
instance_destroy()
impact = instance_create(x+lengthdir_x(18,image_angle),y+lengthdir_y(18,image_angle),obj_impact)
impact.sprite_index = spr_boom_impact;
impact.image_xscale = 0.5;
impact.image_yscale = 0.5;