/// @description Insert description here
// You can write your code in this editor
/*if(global.teamNum[other.num] != global.teamNum[num]) {
		with(ball_game) {
		    buffer_seek(buffer, buffer_seek_start, 0);
		    buffer_write(buffer, buffer_u8, 11);
		    buffer_write(buffer, buffer_u8, ball_player.num);
		    buffer_write(buffer, buffer_u8, 22);
		    network_send_packet(socket, buffer, buffer_tell(buffer));
		}
}