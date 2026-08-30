/// @description Draw Q on surface
if(room == room1) { //draw for rumble mode
	draw_text(x,y-35,variable_global_get(abilityVar+"button"))
	draw_self();
	if(variable_global_get(abilityVar) != 0) {
		draw_text(x,y+20,variable_global_get(abilityVar).name);
		draw_sprite((variable_global_get(abilityVar)).sprite,0,x,y)
	}
}
else if(surface_exists(global.shopSurf)) { 
	if(global.shop && global.shopState == "Abilities") {
		surface_set_target(global.shopSurf);
		//draw_rectangle_color(x-50,y-48,x+50,y-30,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
		draw_text(x,y-40,variable_global_get(abilityVar+"button"))
		draw_rectangle_colour(x-20,y-20,x+20,y+20,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
		draw_rectangle_colour(x-20,y-20,x+20,y+20,c_ltgray,c_ltgray,c_ltgray,c_ltgray,true);
		if(variable_global_get(abilityVar) != 0) {
			draw_rectangle_color(x-45,y+31,x+45,y+41,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
			draw_text_transformed(x,y+28,variable_global_get(abilityVar).name,0.6,0.6,0);
			draw_sprite((variable_global_get(abilityVar)).sprite,0,x,y)
		}
		surface_reset_target();
	}
}