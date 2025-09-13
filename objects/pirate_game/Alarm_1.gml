///@description Send message of death and stats
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,5);
buffer_write(buffer,buffer_u8,obj_client.index);
buffer_write(buffer,buffer_u8,global.loot);
buffer_write(buffer,buffer_u8,killnum);
buffer_write(buffer,buffer_bool,global.alive); //living
buffer_write(buffer,buffer_bool,pirate); //pirate
buffer_write(buffer,buffer_bool,global.captain); //captain
buffer_write(buffer,buffer_bool,global.ship);
buffer_write(buffer,buffer_u8,killnum);
buffer_write(buffer,buffer_bool,global.MTF);
network_send_packet(socket,buffer,buffer_tell(buffer));