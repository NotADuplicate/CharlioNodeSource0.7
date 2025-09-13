/// @description Send death
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,5);
buffer_write(buffer,buffer_u8,obj_client.index);
buffer_write(buffer,buffer_bool,global.bandit);
buffer_write(buffer,buffer_u8,killNum);
network_send_packet(socket,buffer,buffer_tell(buffer));