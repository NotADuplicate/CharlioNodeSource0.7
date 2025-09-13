/// @description Insert description here
// You can write your code in this editor
if(instance_exists(pirate_player) && pirate_player.beast) {
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
	draw_sprite(sprite_index,0,x - vx,y - vy);
	if(marked)
		draw_sprite(spr_mark,0,x - vx,y - vy);
}