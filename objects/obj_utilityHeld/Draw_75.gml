/// @description Insert description here
// You can write your code in this editor
if(global.utilityHeld) {
	surface_set_target(global.shopSurf);
	draw_sprite(global.utilityClass.sprite,0,mouse_x-camera_get_view_x(view_camera[0])-obj_shop.xp, mouse_y-camera_get_view_y(view_camera[0])-obj_shop.yp)
	surface_reset_target();
}