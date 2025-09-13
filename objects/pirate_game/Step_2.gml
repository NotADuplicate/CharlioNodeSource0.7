///@description Send player stats
if(instance_exists(pirate_player)) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 3);
    buffer_write(buffer, buffer_u8, pirate_player.num);
    buffer_write(buffer, buffer_u16, pirate_player.x);
    buffer_write(buffer, buffer_u16, pirate_player.y);
	if(pirate_player.image_alpha == 1)
		buffer_write(buffer, buffer_u8, pirate_player.hp);
	else
		buffer_write(buffer, buffer_u8, 251);
    network_send_packet(socket, buffer, buffer_tell(buffer));
}