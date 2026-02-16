/// @description Draw button and highlight
if(highlighted && global.options == false) {
	draw_sprite(spr_highlightedMenu,0,x,y);
	draw_text_transformed_color(x-30,y-20,str,2,2,0,c_black,c_black,c_black,c_black,1)
}
else {
	draw_self();
	draw_text_transformed(x-30,y-20,str,2,2,0)
}