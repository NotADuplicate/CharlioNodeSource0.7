/// @description Draw tutorial text
if(surface) {
	if(surface_exists(global.shopSurf))
		surface_set_target(global.shopSurf)
}
draw_text(textX,textY,tutText)
draw_arrow(arrowX,arrowY,arrowX,arrowY-32,16)
if(stage == 3 && global.shop == false) {
	draw_text(500,120,"Ammo:")
}
if(surface)
	surface_reset_target()