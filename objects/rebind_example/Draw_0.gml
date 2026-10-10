if(!surface_exists(global.optionsSurf)) {
	return;
}

if(global.options && global.optionState == "Controls") {
	var panel = make_color_rgb(22,24,23);
	var rowColor = make_color_rgb(36,37,33);
	var rowHover = make_color_rgb(45,45,39);
	var keyColor = make_color_rgb(17,18,17);
	var ivory = make_color_rgb(232,225,207);
	var muted = make_color_rgb(100,99,93);
	var gold = make_color_rgb(201,157,60);
	var brightGold = make_color_rgb(230,186,85);

	var left = x-380;
	var right = x+380;
	var top = y-25;
	var bottom = y+25;

	var screenX = camera_get_view_x(view_camera[0])
		+x+obj_options.xp;

	var screenY = camera_get_view_y(view_camera[0])
		+y+obj_options.yp;

	var hovered = point_in_rectangle(
		mouse_x,mouse_y,
		screenX-380,screenY-25,
		screenX+380,screenY+25
	);

	var outline = hovered ? brightGold : muted;
	var inside = hovered ? rowHover : rowColor;

	surface_set_target(global.optionsSurf);

	draw_rectangle_color(
		left,top,
		right,bottom,
		outline,outline,outline,outline,
		false
	);

	draw_rectangle_color(
		left+2,top+2,
		right-2,bottom-2,
		inside,inside,inside,inside,
		false
	);

	var keyLeft = right-185;
	var keyRight = right-18;

	if(selected) {
		draw_rectangle_color(
			keyLeft,top+7,
			keyRight,bottom-7,
			gold,gold,gold,gold,
			false
		);

		draw_set_color(panel);
	}
	else {
		draw_rectangle_color(
			keyLeft,top+7,
			keyRight,bottom-7,
			keyColor,keyColor,keyColor,keyColor,
			false
		);

		draw_set_color(hovered ? brightGold : gold);
		draw_rectangle(
			keyLeft,top+7,
			keyRight,bottom-7,
			true
		);

		draw_set_color(ivory);
	}

	draw_set_halign(fa_left);
	draw_set_color(ivory);
	draw_text(left+22,y-10,txt);

	draw_set_halign(fa_center);

	if(selected) {
		draw_set_color(panel);
		draw_text(
			(keyLeft+keyRight)*.5,
			y-10,
			"PRESS ANY KEY"
		);
	}
	else {
		draw_set_color(ivory);
		draw_text(
			(keyLeft+keyRight)*.5,
			y-10,
			string_upper(variable_global_get(myButton))
		);
	}

	surface_reset_target();

	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_alpha(1);
}