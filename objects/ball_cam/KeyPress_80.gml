/// @description Insert description here
// You can write your code in this editor
/*if(global.shop) {
	global.shop = false;
	y = ball_player.y;
	if(global.dead) { //go back to whole map
		view_set_visible(0,false)
		view_set_visible(1,true)
	}
}
else {
	//if(position_meeting(ball_player.x,ball_player.y,obj_regen) || global.dead) {
		global.shop = true;
		if(global.dead) {
			view_set_visible(0,true)
			view_set_visible(1,false)
		}
	//}
}