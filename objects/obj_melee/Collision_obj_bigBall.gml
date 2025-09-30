/// @description Insert description here
// You can write your code in this editor
if(global.players[num].wallPassive == false) {
	instance_destroy();
	impact = instance_create(x+lengthdir_x(18,image_angle),y+lengthdir_y(18,image_angle),obj_impact)
	impact.sprite_index = spr_boom_impact;
}