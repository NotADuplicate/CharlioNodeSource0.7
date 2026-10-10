if(highlighted && !global.options) {
	draw_sprite_ext(
		spr_highlightedMenu,0,
		x+40,y,
		1.25,1.25,0,
		c_white,1
	);

	draw_text_transformed_color(
		x+10,y-30,str,
		2.5,2.5,0,
		c_black,c_black,c_black,c_black,
		1
	);
}
else {
	draw_sprite_ext(
		spr_menuButton,0,
		x+40,y,
		1.25,1.25,0,
		c_white,1
	);

	draw_text_transformed(
		x+10,y-30,str,
		2.5,2.5,0
	);
}