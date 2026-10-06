if(global.options && tooltip) {
	var helpX = x+string_width(label)*.5+15;
	var helpY = y-23;
	scr_hover_UI(helpX+obj_options.xp, helpY+obj_options.yp, tooltipText, self, "hover", true, 60);
}