/// @description Send to start having 4th slot
if(selected == 0) {
	selected = 1
}
else if(selected == 1 && global.leveled > 0) {
	global.leveled--;
	alarm[0] = 1;
	with(ball_game) {
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 33);
	    buffer_write(buffer, buffer_u8, ball_player.num);
		buffer_write(buffer, buffer_u8, 4);
	    buffer_write(buffer, buffer_u16, 1);
	    network_send_packet(socket, buffer, buffer_tell(buffer));
	}
}