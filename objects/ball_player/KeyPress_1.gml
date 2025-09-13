/// @description Toggle shop
if(keyboard_check_pressed(global.shopKey) && global.typing == false) {
	if(global.shop) {
		global.shop = false;
		ball_cam.y = ball_player.y;
		if(global.dead) { //go back to whole map
			view_set_visible(0,false)
			view_set_visible(1,true)
		}
	}
	else {
		if(position_meeting(x,y,obj_regen) || global.dead) {
			global.shop = true;
			if(global.dead) {
				view_set_visible(0,true)
				view_set_visible(1,false)
			}
		}
	}
}