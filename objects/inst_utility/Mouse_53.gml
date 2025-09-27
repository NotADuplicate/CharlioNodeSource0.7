/// @description Insert description here
// You can write your code in this editor
if(room = room1) {
	if(global.loadoutScreen == "Abilities" && mouse_x < x + 20 && mouse_x > x - 20 && mouse_y < y + 20 && mouse_y > y-20) {
		global.utilityClass = utility;
	}
}
else if(global.shop && global.shopState == "Abilities") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y-4000;
	if(mouse_x < xp + 20 && mouse_x > xp - 20 && mouse_y < yp + 20 && mouse_y > yp-20) {
		global.utilityClass = utility;
	}
}