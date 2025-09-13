/// @description UNLEASH BEAST!
if(instance_exists(pirate_player) && pirate_player.sprite_index != spr_beast) {
	buffer_seek(buffer,buffer_seek_start,0);
	buffer_write(buffer,buffer_u8,12);
	network_send_packet(socket,buffer,buffer_tell(buffer));
}