/// @description Send win
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,8);
buffer_write(buffer,buffer_bool,global.bandit);
network_send_packet(socket,buffer,buffer_tell(buffer));