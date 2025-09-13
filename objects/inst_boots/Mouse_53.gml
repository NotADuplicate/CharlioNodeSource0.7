if(global.shop && global.shopState == "Passives") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x-1000;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y-4200;
	if(mouse_x < xp + 20 && mouse_x > xp - 20 && mouse_y < yp + 20 && mouse_y > yp-20) {
		alarm[1] = 1;
	} else {
		selected = 0;
	}
	clicked = true;
}