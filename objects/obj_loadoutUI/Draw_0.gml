/// @description 
if(global.loadoutScreen == "Abilities") {
	draw_text_transformed(145,915,global.utilityClass.name,2,2,0);
	draw_text_ext(145,1000,global.utilityClass.text,20,250)
}
else {
	draw_text_transformed(145,955,global.atktext,2,2,0);
}