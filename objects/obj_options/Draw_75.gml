/// @description Draw options menu

var panel = make_color_rgb(22,24,23);
var panelRaised = make_color_rgb(36,37,33);
var tabInactive = make_color_rgb(29,30,28);
var ivory = make_color_rgb(232,225,207);
var muted = make_color_rgb(100,99,93);
var gold = make_color_rgb(201,157,60);
var closeColor = make_color_rgb(75,31,31);
var closeHoverColor = make_color_rgb(115,43,43);

if(!surface_exists(global.optionsSurf)) {
	global.optionsSurf = surface_create(950,700);
	firstDraw = true;
	wipe = true;
}

if(!variable_instance_exists(id,"drawnOptionState"))
	drawnOptionState = "";

if(drawnOptionState != global.optionState) {
	drawnOptionState = global.optionState;
	wipe = true;
}

if(global.options) {
	if(height <= 0)
		wipe = true;

	height = min(700,height+70);
}
else {
	height = max(0,height-100);
}

if(height > 0) {
	draw_rectangle_color(
		xp,yp,
		xp2,yp+height,
		panel,panel,panel,panel,
		false
	);

	draw_line_width_color(
		xp,yp,xp2,yp,
		4,gold,gold
	);

	draw_line_width_color(
		xp,yp+height,xp2,yp+height,
		4,gold,gold
	);

	draw_line_width_color(
		xp,yp,xp,yp+height,
		4,gold,gold
	);

	draw_line_width_color(
		xp2,yp,xp2,yp+height,
		4,gold,gold
	);
}

surface_set_target(global.optionsSurf);

if(firstDraw || wipe) {
	draw_clear(panel);

	switch(global.optionState) {
		case "General":
			draw_rectangle_color(
				40,135,910,285,
				panelRaised,panelRaised,
				panelRaised,panelRaised,
				false
			);

			draw_rectangle_color(
				40,315,910,580,
				panelRaised,panelRaised,
				panelRaised,panelRaised,
				false
			);

			draw_set_color(gold);
			draw_rectangle(40,135,910,285,true);
			draw_rectangle(40,315,910,580,true);

			draw_rectangle_color(
				40,135,205,168,
				gold,gold,gold,gold,
				false
			);

			draw_rectangle_color(
				40,315,275,348,
				gold,gold,gold,gold,
				false
			);

			draw_set_color(panel);

			draw_text_transformed(
				122,144,
				"GAMEPLAY",
				1,1,0
			);

			draw_text_transformed(
				157,324,
				"DISPLAY & INTERFACE",
				1,1,0
			);
		break;

		case "Audio":
			draw_rectangle_color(
				150,135,800,500,
				panelRaised,panelRaised,
				panelRaised,panelRaised,
				false
			);

			draw_set_color(gold);
			draw_rectangle(150,135,800,500,true);

			draw_rectangle_color(
				150,135,300,168,
				gold,gold,gold,gold,
				false
			);

			draw_set_color(panel);

			draw_text_transformed(
				225,144,
				"VOLUME",
				1,1,0
			);
		break;

		case "Controls":
			draw_rectangle_color(
				40,135,910,650,
				panelRaised,panelRaised,
				panelRaised,panelRaised,
				false
			);

			draw_set_color(gold);
			draw_rectangle(40,135,910,650,true);
		break;
	}

	firstDraw = false;
	wipe = false;
}

draw_rectangle_color(
	0,0,900,90,
	tabInactive,tabInactive,
	tabInactive,tabInactive,
	false
);

var closeHovered = point_in_rectangle(
	mouse_x,mouse_y,
	xp+900,yp,
	xp+950,yp+90
);

var currentCloseColor = closeHovered
	? closeHoverColor
	: closeColor;

draw_rectangle_color(
	900,0,950,90,
	currentCloseColor,currentCloseColor,
	currentCloseColor,currentCloseColor,
	false
);

var tabStart;
var tabEnd;

switch(global.optionState) {
	case "General":
		tabStart = 0;
		tabEnd = 300;
	break;

	case "Audio":
		tabStart = 300;
		tabEnd = 600;
	break;

	case "Controls":
		tabStart = 600;
		tabEnd = 900;
	break;
}

draw_rectangle_color(
	tabStart,0,
	tabEnd,90,
	panelRaised,panelRaised,
	panelRaised,panelRaised,
	false
);

draw_rectangle_color(
	tabStart+8,84,
	tabEnd-8,90,
	gold,gold,gold,gold,
	false
);

draw_set_color(make_color_rgb(65,64,58));
draw_line(300,15,300,75);
draw_line(600,15,600,75);
draw_line(900,0,900,90);

draw_set_color(ivory);

draw_text_transformed(
	150,29,
	"General",
	1.75,1.75,0
);

draw_text_transformed(
	450,29,
	"Audio",
	1.75,1.75,0
);

draw_text_transformed(
	750,29,
	"Controls",
	1.75,1.75,0
);

draw_text_transformed(
	925,23,
	"X",
	2.5,2.5,0
);

surface_reset_target();

if(height > 1) {
	draw_surface_part(
		global.optionsSurf,
		0,0,
		950,height,
		xp,yp
	);
}

draw_set_color(c_white);
draw_set_alpha(1);