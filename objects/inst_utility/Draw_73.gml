/*// @description Insert description here
// You can write your code in this editor
draw_text(x+25,y+20,statOrder[0])
draw_text(x-25,y+20,statAmmmo)*/
if(room == room1) {
	if(global.loadoutScreen == "Abilities" || obj_client.rumbleSetup) {
		draw_rectangle_colour(x-40,y-40,x+40,y+40,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
		draw_rectangle_colour(x-40,y-40,x+40,y+40,c_ltgray,c_ltgray,c_ltgray,c_ltgray,true);
		draw_sprite(utility.sprite,0,x,y-10);
		draw_text(x,y+10,utility.name)
	}
}
else if(surface_exists(global.shopSurf) && (drawOnce > 0 || selectionChanged)) {
	surface_set_target(global.shopSurf);
	selectionChanged = false;

	if(selected) {
		draw_rectangle_colour(x-40,y-40,x+40,y+40,c_yellow,c_yellow,c_yellow,c_yellow,false);
	} else {
		draw_rectangle_colour(x-40,y-40,x+40,y+40,c_ltgray,c_ltgray,c_ltgray,c_ltgray,false);
	}
	draw_rectangle_colour(x-38,y-38,x+38,y+38,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
	
	draw_sprite(utility.sprite,0,x,y-10);
	draw_text_ext_transformed(x,y+10,utility.name,15,70,0.8,0.8,0)
	surface_reset_target();
	drawOnce--;
}