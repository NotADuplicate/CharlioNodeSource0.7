/// @description highlight
if(surface_exists(global.shopSurf) && global.shopState == "Passives") {
	surface_set_target(global.shopSurf);
	
	xp = x - 1000;
	yp = y - 4200;
	
	if(clicked) {
		if(global.bootsObj = self) {
			//draw_rectangle_color(xp-16,yp-16,xp+16,yp+16,c_yellow,c_yellow,c_yellow,c_yellow,true)
			//draw_rectangle_color(xp-15,yp-15,xp+15,yp+15,c_yellow,c_yellow,c_yellow,c_yellow,true)
			draw_rectangle_color(xp-30,yp-30,xp+30,yp+30,c_yellow,c_yellow,c_yellow,c_yellow,false)
		}
		else if(selected == 1) {
			//draw_rectangle_color(xp-16,yp-16,xp+16,yp+16,c_green,c_green,c_green,c_green,true)
			//draw_rectangle_color(xp-15,yp-15,xp+15,yp+15,c_green,c_green,c_green,c_green,true)
			draw_rectangle_color(xp-30,yp-30,xp+30,yp+30,c_green,c_green,c_green,c_green,false)
			draw_rectangle_color(600,150,900,500,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
			draw_text_ext(750,200,str,20,300)
		} else {
			draw_rectangle_color(xp-31,yp-31,xp+31,yp+31,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
		}
	}
	draw_sprite_ext(spr_white,0,xp,yp,1.5,1.5,0,c_white,1);
	draw_sprite_ext(spr,0,xp,yp,1.5,1.5,0,c_white,1);
	
	surface_reset_target();
}