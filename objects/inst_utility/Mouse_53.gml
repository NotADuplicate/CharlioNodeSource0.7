/// @description Insert description here
// You can write your code in this editor
if(room = room1) {
	if(global.loadoutScreen == "Abilities" && mouse_x < x + 20 && mouse_x > x - 20 && mouse_y < y + 20 && mouse_y > y-20) {
		global.utilityClass = utility;
		if(obj_client.rumbleSetup) {
			obj_client.rumblePicking = "Ability"
		}
	}
}
else if(global.shop && global.shopState == "Abilities") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	if(mouse_x < xp + 40 && mouse_x > xp - 40 && mouse_y < yp + 40 && mouse_y > yp-40) {
		global.utilityClass = utility;
		selected = true;
		selectionChanged = true;
	} else if(selected) {
		selected = false;
		selectionChanged = true;
	}
}