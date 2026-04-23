/// @description Rebind all butons
if(global.options && global.optionState == "Controls") {
	xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
	yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	if(mouse_x > xp-48 && mouse_x < xp + 48 && mouse_y > yp-24 && mouse_y < yp+24) { //actually be clicked

		keyboard_unset_map()
		
		global.spacekey = vk_space;
		global.Qkey = ord("Q");
		global.spacebutton = "Space";
		global.Qbutton = "Q";
		global.rightbutton = "RC";
		global.mapbutton = "M";
		global.mapKey = ord("M")
		global.backbutton = "B";
		global.backKey = ord("B")
		global.shopbutton = "P";
		global.shopKey = ord("P")
		global.rightkey = 700;
		global.Rkey = ord("R");
		global.Rbutton = "R";
		
		
	}
}