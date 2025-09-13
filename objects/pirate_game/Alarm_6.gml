/// @description Send bounties to server
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,20);
buffer_write(buffer,buffer_u8,global.genGain);
buffer_write(buffer,buffer_u8,global.killGain);
network_send_packet(socket,buffer,buffer_tell(buffer));