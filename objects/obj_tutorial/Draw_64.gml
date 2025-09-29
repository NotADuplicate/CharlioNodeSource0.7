/// @description Draw tutorial text
if(surface) {
	if(surface_exists(global.shopSurf))
		surface_set_target(global.shopSurf)
}

if(textShake > 9) {
	textOffset += 6;
	textShake--
} else if(textShake > 3) {
	textOffset -= 6;
	textShake--
} else if(textShake > 0) {
	textOffset += 6;
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