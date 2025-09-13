/// @description Click onto surface
if(room = room1) {
	if(global.loadoutScreen == "Guns" && mouse_x < x + 20 && mouse_x > x - 20 && mouse_y < y + 20 && mouse_y > y-20) {
		alarm[0] = 1;
	}
}
else if(global.shop && global.shopState == "Passives") {
	selected = false;
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x-930;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y-4250;
	if(mouse_x < xp + 20 && mouse_x > xp - 20 && mouse_y < yp + 20 && mouse_y > yp-20) {
		alarm[0] = 1;
		selected = true;
	}  
}