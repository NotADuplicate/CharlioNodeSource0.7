/// @description Draw tutorial text
if(surface) {
	textScale = 1;
	if(surface_exists(global.shopSurf))
		surface_set_target(global.shopSurf)
} else {
	if(textShake > 6) {
		textOffset += 9;
		textShake--
	} else if(textShake > 2) {
		textOffset -= 9;
		textShake--
	} else if(textShake > 0) {
		textOffset += 9;
		textShake--
	}
	else {
		textOffset = 0;
	}
}

var width = string_width(tutText)
var height = string_height(tutText)
draw_set_alpha(0.5);
draw_rectangle_colour(textX-(width/2)-10,textY-10,textX+(width/2)+10,textY+(height)+10,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
draw_set_alpha(0.75);
draw_text_transformed(textX+textOffset,textY,tutText,textScale, textScale, 0);
draw_arrow(arrowX,arrowY,arrowX,arrowY-32,16)
draw_set_alpha(1)
if(stage == 3 && global.shop == false) {
	draw_text(512,120,"Ammo:")
}
if(surface)
	surface_reset_target()