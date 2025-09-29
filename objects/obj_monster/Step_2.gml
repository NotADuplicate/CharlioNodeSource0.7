/// @description Die
if(hp < 0 && global.testMode) {
	alarm[8] = 1;
	alarm[10] = 2;
}
/*if(hp < 0 && num == ball_player.num && dead == false)  {
	dead = true;
	with(ball_game) {
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 5);
	    buffer_write(buffer, buffer_u8, other.nameNum);
	    buffer_write(buffer, buffer_u8, other.num);
	    network_send_packet(socket, buffer, buffer_tell(buffer));
	}
}