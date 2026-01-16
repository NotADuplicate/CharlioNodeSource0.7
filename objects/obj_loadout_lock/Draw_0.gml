if(obj_client.loadoutPicking && obj_client.loadoutPickingIndex == obj_client.index) {
	draw_self();
	draw_text_transformed_colour(x,y,"LOCK", 2, 2, 0, c_black, c_black, c_black, c_black,1);
}