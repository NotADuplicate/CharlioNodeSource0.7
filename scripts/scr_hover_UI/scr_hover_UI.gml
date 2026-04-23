// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_hover_UI(xp, yp, text, object, hoverVar, up, height){
	draw_set_halign(fa_center);
	mouseX = mouse_x - camera_get_view_x(view_camera[0]);
	mouseY = mouse_y - camera_get_view_y(view_camera[0]);
	if(mouseX > xp-22 && mouseX < xp+22 && mouseY > yp-22 && mouseY < yp+22) {
		hover = variable_instance_get(object,hoverVar)
		variable_instance_set(object, hoverVar, hover+1);
		if(hover < 4) {
			return;
		}
		var alpha = min(hover/15,0.8)
		draw_set_alpha(alpha);
		
		draw_rectangle_color(xp-70,yp-20*up-height,xp+70,yp-20*up,c_grey,c_grey,c_grey,c_grey,false);
		if(up == 1) {
			draw_text(xp,yp-height-20,text);
		} else {
			draw_text(xp,yp+20,text);
		}
		draw_set_alpha(1);
	}
	else {
		variable_instance_set(object, hoverVar, 0);
	}
}