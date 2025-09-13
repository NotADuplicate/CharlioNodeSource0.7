/// @description Free TP
if(position_meeting(ball_player.x, ball_player.y, obj_regen) && global.teleportTimer <= 0) {
	if(keyboard_check(global.mapKey)) { 
		scale = 0.077
		mouseX = mouse_x - camera_get_view_x(view_camera[0]);
		mouseY = mouse_y - camera_get_view_y(view_camera[0]);
		xp1 = 480;
		yp1 = 470
		
		if(mouseX > xp1 && mouseY > yp1) {
			xp = (mouseX-xp1)/scale;
			yp = (mouseY-yp1)/scale;
			with(ball_game) {
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", other.xp, "Y", other.yp, "Obj", obj_free_TP, "Dir", 0)
			}
			global.teleportTimer = 150; 
		}
	}
}