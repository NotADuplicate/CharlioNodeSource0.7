var cardHalfWidth = 190;
var cardLeft = x-cardHalfWidth;
var cardRight = x+cardHalfWidth;
var cardTop = 140;
var cardBottom = 720;

var panel = make_color_rgb(22,24,23);
var panelRaised = make_color_rgb(36,37,33);
var header = make_color_rgb(43,40,31);
var ivory = make_color_rgb(232,225,207);
var gold = make_color_rgb(201,157,60);
var brightGold = make_color_rgb(230,186,85);

var hovered = point_in_rectangle(
	mouse_x,mouse_y,
	cardLeft,cardTop,
	cardRight,cardBottom
);

var accent = hovered ? brightGold : gold;

draw_rectangle_color(
	cardLeft,cardTop,
	cardRight,cardBottom,
	accent,accent,accent,accent,
	false
);

draw_rectangle_color(
	cardLeft+4,cardTop+4,
	cardRight-4,cardBottom-4,
	panel,panel,panel,panel,
	false
);

draw_rectangle_color(
	cardLeft+4,cardTop+4,
	cardRight-4,cardTop+52,
	header,header,header,header,
	false
);

draw_set_halign(fa_center);
draw_set_color(accent);
draw_text_transformed(
	x,
	cardTop+15,
	type,
	1.25,1.25,0
);

var nameScale = min(
	2,
	330/max(1,string_width(item.name))
);

draw_set_color(ivory);
draw_text_transformed(
	x,
	cardTop+70,
	item.name,
	nameScale,nameScale,0
);

draw_rectangle_color(
	x-54,cardTop+115,
	x+54,cardTop+223,
	ivory,ivory,ivory,ivory,
	false
);

draw_set_color(accent);
draw_rectangle(
	x-57,cardTop+112,
	x+57,cardTop+226,
	true
);

if(sprite_exists(item.sprite)) {
	draw_sprite_ext(
		item.sprite,
		0,
		x,cardTop+169,
		2,2,0,
		c_white,1
	);
}

draw_rectangle_color(
	cardLeft+28,cardTop+250,
	cardRight-28,cardTop+254,
	accent,accent,accent,accent,
	false
);

draw_set_color(ivory);
var scale = string_length(item.text) > 180 ? 1.15 : 1.25;
draw_text_ext_transformed(
	x,
	cardTop+282,
	item.text,
	20,
	350/scale,
	scale,
	scale,
	0
);

var buttonLeft = cardLeft+28;
var buttonRight = cardRight-28;
var buttonTop = cardBottom-78;
var buttonBottom = cardBottom-22;

draw_rectangle_color(
	buttonLeft,buttonTop,
	buttonRight,buttonBottom,
	accent,accent,accent,accent,
	false
);

var buttonInside = hovered ? accent : panelRaised;

draw_rectangle_color(
	buttonLeft+4,buttonTop+4,
	buttonRight-4,buttonBottom-4,
	buttonInside,buttonInside,buttonInside,buttonInside,
	false
);

draw_set_color(hovered ? panel : accent);
draw_text_transformed(
	x,
	buttonTop+17,
	"UNLOCK " + type,
	1.5,1.5,0
);

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);