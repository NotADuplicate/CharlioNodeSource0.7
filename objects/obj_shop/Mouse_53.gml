/// @description Switch options state
if(global.shop) {
	relativeX = xp + camera_get_view_x(view_camera[0]);
	relativeY = yp + camera_get_view_y(view_camera[0]);
	if(mouse_y > relativeY && mouse_y < relativeY+90 && mouse_x > relativeX && mouse_x < relativeX + 950) {
		
		if(mouse_x < relativeX + 470) {
			if(global.shopState != "Abilities") {
				wipe = true;
				global.shopState = "Abilities";
				with(inst_utility) {
					drawOnce = 2;
				}
			}
		}
		else if(global.shopState != "Passives") {
			wipe = true;
			global.shopState = "Passives";
		}
	}
}