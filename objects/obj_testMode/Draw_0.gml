// Inherit the parent event
if(global.newPlayer && x > 0) {
	var scale = 1.25;
	var buttonRight = x+40
		+ (sprite_get_width(spr_menuButton)
		- sprite_get_xoffset(spr_menuButton))*scale;

	var left = buttonRight-55;
	var rightTop = buttonRight+130;
	var rightBottom = buttonRight+100;
	var top = y-15;
	var bottom = y+15;
	var gold = make_color_rgb(230,186,85);
	var lightGold = make_color_rgb(255,211,105);

	draw_triangle_color(
		left,top-4,
		rightTop+8,top-4,
		left,bottom+4,
		c_black,c_black,c_black,
		false
	);
	draw_triangle_color(
		rightTop+8,top-4,
		rightBottom,bottom+4,
		left,bottom+4,
		c_black,c_black,c_black,
		false
	);

	draw_triangle_color(
		left,top,
		rightTop,top,
		left,bottom,
		gold,lightGold,gold,
		false
	);
	draw_triangle_color(
		rightTop,top,
		rightBottom,bottom,
		left,bottom,
		lightGold,lightGold,gold,
		false
	);

	draw_text_transformed_color(
		buttonRight+47,y-8,
		"START HERE",
		1,1,0,
		c_black,c_black,c_black,c_black,
		1
	);
}

event_inherited();

