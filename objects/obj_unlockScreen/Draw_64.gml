var camera = view_camera[0];
var viewX = camera_get_view_x(camera);
var viewY = camera_get_view_y(camera);
var viewW = camera_get_view_width(camera);
var viewH = camera_get_view_height(camera);

var background = make_color_rgb(15,16,15);
var ivory = make_color_rgb(232,225,207);
var muted = make_color_rgb(165,163,153);
var gold = make_color_rgb(201,157,60);
var centerX = viewX+viewW*.5;

draw_set_alpha(.96);
draw_rectangle_color(
	viewX,viewY,
	viewX+viewW,viewY+viewH,
	background,background,background,background,
	false
);
draw_set_alpha(1);

draw_set_halign(fa_center);

draw_set_color(ivory);
draw_text_transformed(
	centerX,
	viewY+35,
	"CHOOSE A NEW ABILITY",
	2,2,0
);

draw_set_color(muted);
draw_text(
	centerX,
	viewY+78,
	"Select one ability to unlock"
);

draw_rectangle_color(
	centerX-180,viewY+108,
	centerX+180,viewY+111,
	gold,gold,gold,gold,
	false
);

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);