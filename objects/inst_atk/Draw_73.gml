/// @description Draw onto surface
if(room == room1) {
	if(global.loadoutScreen == "Guns") {
		draw_sprite(spr_white,0,x,y);
		draw_sprite(spr,0,x,y);
	}
}
else if(surface_exists(global.shopSurf) && global.shopState == "Passives") {
	surface_set_target(global.shopSurf);
	
	xp = x - 930;
	yp = y - 4250;
	draw_sprite_ext(spr_white,0,xp,yp,1.5,1.5,0,c_white,0.8);
	draw_sprite(spr,0,xp,yp);
	
	if(selected) {
		draw_rectangle_color(600,82,900,310,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
		draw_text_transformed(750,100,scr_gun_name(atk),2,2,0)
		draw_text_ext(750,200,scr_gun_text(atk),20,300)
	}
	
	surface_reset_target();
}