/// @description Drone costs ammo
if(drone == ball_player.num) {
	if(global.ammo > 0) {
		scr_ball_ammo(droneAmmo);
		alarm[9] = 30;
		droneAmmo++;
	}
	else {
		with(ball_game) {
		    /*buffer_seek(buffer, buffer_seek_start, 0);
		    buffer_write(buffer, buffer_u8, 11);
		    buffer_write(buffer, buffer_u8, ball_player.num);
		    buffer_write(buffer, buffer_u8, 48);
		    network_send_packet(socket, buffer, buffer_tell(buffer));*/
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 48)
		}
	}
}