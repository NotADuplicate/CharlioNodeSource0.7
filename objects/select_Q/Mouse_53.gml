/// @description Release to select or start dragging to swap abilities
if(room == room1) { //instant buy for rumble mode
	if(mouse_x < x + 16 && mouse_x > x - 16 && mouse_y < y + 16 && mouse_y > y-16) {
		variable_global_set(abilityVar, global.utilityClass);
		with(obj_client) {
			node_send(buffer,"eventName","Rumble Select","Num",obj_client.index,"type","Ability","Index",variable_global_get(other.abilityVar).abilityIndex)
		}
		show_debug_message("Rumble select ability")
		show_debug_message(variable_global_get(other.abilityVar).abilityIndex)
		audio_play_sound(snd_buy,1,false)
	}
}
else if(global.shop && global.shopState == "Abilities") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	if(mouse_x < xp + 16 && mouse_x > xp - 16 && mouse_y < yp + 16 && mouse_y > yp-16) {
		clicked = true;
	}
}