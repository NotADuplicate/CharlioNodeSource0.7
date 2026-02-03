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
		//game_end();
		surface_set_target(global.shopSurf);
		//draw_rectangle_color(x-50,y-48,x+50,y-30,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
		draw_text(x,y-35,variable_global_get(abilityVar+"button"))
		draw_self();
		if(variable_global_get(abilityVar) != 0) {
			draw_rectangle_color(x-50,y+17,x+50,y+40,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,obj_shop.rectColor,false)
			draw_text(x,y+20,variable_global_get(abilityVar).name);
			draw_sprite((variable_global_get(abilityVar)).sprite,0,x,y)
		}
		surface_reset_target();
	}
}