/// @description Draw button and highlight
xp = camera_get_view_x(view_camera[0])+x;
yp = camera_get_view_y(view_camera[0])+y;
highlighted = mouse_x > xp - 150 && mouse_x < xp + 150 && mouse_y < yp + 20 && mouse_y > yp -20
if(highlighted) {
	draw_sprite_ext(spr_highlightedMenu,0,x,y,1.5,1,0,c_white,1);
	draw_text_transformed_color(x-30,y-20,str,2,2,0,c_black,c_black,c_black,c_black,1)
}
else {
	draw_self();
	draw_text_transformed(x-30,y-20,str,2,2,0)
}