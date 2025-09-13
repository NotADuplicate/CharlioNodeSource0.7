/// @description Rebind all butons
if(global.options && global.optionState == "Controls") {
	xp = camera_get_view_x(view_camera[0])+x+obj_options.xp;
	yp = camera_get_view_y(view_camera[0])+y+obj_options.yp;
	if(mouse_x > xp-48 && mouse_x < xp + 48 && mouse_y > yp-24 && mouse_y < yp+24) { //actually be clicked

		keyboard_unset_map()

		/*global.spacekey = ini_write_real("Save1","spacekey",vk_space);
		global.Rkey = ini_write_real("Save1","Rkey",ord("R"));
		global.Rbutton = ini_write_string("Save1","Rbutton","R");
		global.Qkey = ini_write_real("Save1","Qkey",ord("Q"));
		global.spacebutton = ini_write_string("Save1","spacebutton","Space");
		global.Qbutton = ini_write_string("Save1","Qbutton","Q");
		global.rightbutton = ini_write_string("Save1","rightbutton","RC");
		global.mapbutton = ini_write_string("Save1","mapbutton","M");
		//global.mapKey = ini_write_real("Save1","mapKey",ord("M"));
		global.backbutton = ini_write_string("Save1","backbutton","B");
		global.backKey = ini_write_real("Save1","backKey",ord("B"))
		global.shopbutton = ini_write_string("Save1","shopbutton","P");
		global.shopKey = ini_write_real("Save1","shopKey",ord("P"))
		global.binded2Right = ini_write_real("Save1","binded2Right",0);
		global.rightBinded = ini_write_string("Save1","rightBinded","right");*/
		
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
		global.binded2Right = 0;
		global.rightBinded = "right";
		global.Rkey = ord("R");
		global.Rbutton = "R";
		
		
	}
}