/// @description Draw "Right"
draw_self();
draw_sprite(scr_gun_sprite(global.loadoutSet[global.selectedLoadout][loadoutNum]),0,x,y)
/*if(surface_exists(global.shopSurf)) { 
	if(global.shop && global.shopState == "Abilities") {
		surface_set_target(global.shopSurf);

		draw_text(x,y-35,global.rightbutton)
		draw_self()
		if(global.right != 0) {
			draw_text(x,y+20,global.right);
			draw_sprite(scr_ability_sprite(global.right),0,x,y)
		}
		
		surface_reset_target();
	}
}