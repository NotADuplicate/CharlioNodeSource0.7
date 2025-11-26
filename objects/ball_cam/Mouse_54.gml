/// @description Spectating toggle map or player
if(global.spectator || global.dead) {
	if(view_get_visible(0)) { //go from zoomed in to map
		show_debug_message("Zooming out to map")
		view_set_visible(0,false)
		view_set_visible(1,true)
	}
	else if(view_get_visible(1)) { //go from map to zoomed in wherever you clicked
		x = mouse_x;
		y = mouse_y;
		link = self;
		view_set_visible(1,false)
		view_set_visible(0,true)
	}
		/*mousePinx = mouse_x;
		mousePiny = mouse_y;
		cameraPinx = x;
		cameraPiny = y;*/
}