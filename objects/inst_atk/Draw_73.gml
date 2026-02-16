/// @description Draw onto surface
if(room == room1) {
	if(global.loadoutScreen == "Guns" || obj_client.rumbleSetup) {
		draw_sprite_ext(spr_white,0,x,y,1.5,1.5,0,c_white,0.8);
		draw_sprite(spr,0,x,y);
	}
}
else if(surface_exists(global.shopSurf) && global.shopState == "Passives") {
	surface_set_target(global.shopSurf);
	
	xp = x - 930;
	yp = y - 4250;
	if(global.attack == atk) {
		draw_rectangle_colour(xp-30,yp-30,xp+30,yp+30,c_green,c_green,c_green,c_green,false)
	} else {
		draw_rectangle_colour(xp-30,yp-30,xp+30,yp+30,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
	}
	draw_sprite_ext(spr_white,0,xp,yp,1.5,1.5,0,c_white,0.8);
	draw_sprite(spr,0,xp,yp);
	
	if(selected) {
		draw_rectangle_color(600,82,900,310,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
		draw_text_transformed(750,100,scr_gun_name(atk),2,2,0)
		draw_text_ext(750,200,scr_gun_text(atk),20,300)
	}
	
	surface_reset_target();
}