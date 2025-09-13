/// @description Insert description here
// You can write your code in this editor
if(global.players[num].wallPassive == false) {
	instance_destroy()
	instance_create(x+lengthdir_x(28,image_angle),y+lengthdir_y(28,image_angle),obj_impact)
}