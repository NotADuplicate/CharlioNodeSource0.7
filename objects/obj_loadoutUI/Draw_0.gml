/// @description 
if(obj_client.rumbleSetup) {
	if(obj_client.rumblePicking == "Ability") {
		draw_text_transformed(820,300,global.utilityClass.name,2,2,0);
		draw_text_ext(820,385,global.utilityClass.text,20,250)
	} else if(obj_client.rumblePicking == "Gun") {
		draw_text_transformed(820,300,global.atktext,2,2,0);
		draw_text_ext(820,385,scr_gun_text(global.attack),20,250)
	} 
}

if(global.loadoutScreen == "Abilities") {
	draw_text_transformed(145,915,global.utilityClass.name,2,2,0);
	draw_text_ext(145,1000,global.utilityClass.text,20,250)
}
else {
	draw_text_transformed(145,955,global.atktext,2,2,0);
}