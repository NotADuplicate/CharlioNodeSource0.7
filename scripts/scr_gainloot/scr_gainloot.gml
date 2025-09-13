function scr_gainloot(argument0, argument1) {
	xp = argument0;
	yp = argument1;
	buffer = obj_client.buffer;
	socket = obj_client.socket;
	buffer_seek(buffer,buffer_seek_start,0);
	buffer_write(buffer,buffer_u8,18); //destroy loot
	buffer_write(buffer,buffer_u16,xp); 
	buffer_write(buffer,buffer_u16,yp);
	network_send_packet(socket,buffer,buffer_tell(buffer));


}
