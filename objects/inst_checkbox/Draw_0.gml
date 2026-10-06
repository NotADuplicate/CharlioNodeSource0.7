if(!surface_exists(global.optionsSurf))
	global.optionsSurf = surface_create(950,700);

if(global.options && global.optionState == "General") {
	var ivory = make_color_rgb(232,225,207);
	var gold = make_color_rgb(201,157,60);

	surface_set_target(global.optionsSurf);

	draw_self();

	draw_set_color(ivory);
	draw_text(x,y-40,label);

	var helpX = x+string_width(label)*.5+15;
	var helpY = y-23;

	if(tooltip) {
		draw_set_color(gold);
		draw_rectangle(
			helpX-12,helpY-12,
			helpX+12,helpY+12,
			true
		);

		draw_text_transformed(
			helpX,
			helpY-10,
			"?",
			1.25,1.25,0
		);
	}

	surface_reset_target();

	draw_set_color(c_white);
}