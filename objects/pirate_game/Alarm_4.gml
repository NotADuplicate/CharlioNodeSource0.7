///@description Send that all pirates are dead
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,14); //escape pod
//buffer_write(buffer,buffer_u8,global.loot);
network_send_packet(socket,buffer,buffer_tell(buffer));