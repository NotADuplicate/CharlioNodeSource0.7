/// @description Insert description here
// You can write your code in this editor
if(global.players[num].wallPassive == false) {
	instance_create(x+lengthdir_x(38,image_angle),y+lengthdir_y(38,image_angle),obj_impact)
	instance_destroy()
}