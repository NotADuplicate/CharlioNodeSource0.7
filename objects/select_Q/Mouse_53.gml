/// @description Release to select or start dragging to swap abilities
if(global.shop && global.shopState == "Abilities") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	if(mouse_x < xp + 16 && mouse_x > xp - 16 && mouse_y < yp + 16 && mouse_y > yp-16) {
		clicked = true;
	}
}