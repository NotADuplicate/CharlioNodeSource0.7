/// @description Draw tutorial text
if(surface) {
	textScale = 1;
	if(surface_exists(global.shopSurf))
		surface_set_target(global.shopSurf)
}

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

draw_text_transformed(textX+textOffset,textY,tutText,textScale, textScale, 0);

draw_arrow(arrowX,arrowY,arrowX,arrowY-32,16)
if(stage == 3 && global.shop == false) {
	draw_text(500,120,"Ammo:")
}
if(surface)
	surface_reset_target()