/// @description Player is marked
	buffer_seek(buffer,buffer_seek_start,0);
	buffer_write(buffer,buffer_u8,8);
	buffer_write(buffer,buffer_u8,obj_client.index);
	network_send_packet(socket,buffer,buffer_tell(buffer));