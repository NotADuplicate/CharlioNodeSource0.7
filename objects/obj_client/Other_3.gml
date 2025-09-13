/// @description Kill
if(global.connected == true) {
	/*scr_endTeam(buffer,socket);
    buffer_seek(buffer,buffer_seek_start,0);
    buffer_write(buffer,buffer_u8,38); //connection message
	buffer_write(buffer,buffer_bool,false); //ready
	network_send_udp(socket, global.serverip, 8001,buffer,buffer_tell(buffer));*/
	node_send(buffer,"eventName","Disconnect","Num",index)
    network_destroy(socket);
}
buffer_delete(buffer);