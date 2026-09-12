/// @description Draw gray square with black border as it drops down
if(height > 0) {
	draw_rectangle_color(xp,yp,xp2,yp+height,rectColor,rectColor,rectColor,rectColor,false);
	draw_line_width_color(xp,yp,xp2,yp,6,borderColor,borderColor);
	draw_line_width_color(xp,yp+height,xp2,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp,yp,xp,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp2,yp,xp2,yp+height,6,borderColor,borderColor);
}

surface_set_target(global.optionsSurf);

if(firstDraw) {
	draw_rectangle_color(0,0,900,90,tabsColor,tabsColor,tabsColor,tabsColor,false);
	draw_rectangle_color(900,0,950,90,escapeColor,escapeColor,escapeColor,escapeColor,false);
	draw_text_transformed(130,30,"General",2,2,0);
	draw_text_transformed(780,30,"Controls",2,2,0);
	draw_text_transformed(460,30,"Audio",2,2,0);
	draw_text_transformed(920,15,"X",3,3,0)
	//firstDraw = false;
}

if(wipe) {
	draw_rectangle_color(0,110,950,800,rectColor,rectColor,rectColor,rectColor,false);
	wipe = false;
}

draw_rectangle_color(0,90,950,110,rectColor,rectColor,rectColor,rectColor,false);
switch(global.optionState) {
	case "General":
		draw_rectangle_color(0,90,315,110,tabsColor,tabsColor,tabsColor,tabsColor,false);
	break;
	case "Audio":
		draw_rectangle_color(315,90,630,110,tabsColor,tabsColor,tabsColor,tabsColor,false);
	break;
	case "Controls":
		draw_rectangle_color(630,90,900,110,tabsColor,tabsColor,tabsColor,tabsColor,false);
	break;
}

if(!global.options) {
	if(height > 0)
		height -= 100;
}
else if(height < 700)
	height += 70;
	
surface_reset_target();

if(height > 1)
	draw_surface_part(global.optionsSurf,0,0,xp2-xp,height,xp,yp);