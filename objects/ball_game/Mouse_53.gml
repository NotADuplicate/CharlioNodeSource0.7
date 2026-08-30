///Shoot bullet (switch)
if(held || ball_player.ninja) {
	held = false;
	ball_player.ninja = 0;
	if(global.throwRange > 0) {
		global.throwRange = 0;
		node_send(buffer, "eventName", "Throw Sprite", "Num", ball_player.num, "Sprite", -1)
	}
	if(global.attack != obj_minigun) {
		return;
	}
}
held = false
timer = 0;
with(ball_player) {
	if(global.mapShowing) {
		if(place_meeting(x,y,obj_warp)) {
			show_debug_message("Standing on warp");
			other.shootable = false;
		}
	}
}
if(ball_player.quickTap <= 0)
	scr_primary_fire();
if((global.attack == obj_grenade || global.attack == obj_minigun) && scr_shootable()) {
    global.slow = .5;
    if(global.attack == obj_minigun) {
		revving = 30;
		with(obj_gun) {
			if(num == ball_player.num) {
				revving = true;
			}
		}
		node_send(buffer, "eventName", "Status", "Target", ball_player.num, "Status Num", 57);
	}
	totalspray = 0;
}