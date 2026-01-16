/// @description Disconnect
/*if(ready == true) {
    buffer_seek(buffer,buffer_seek_start,0);
    buffer_write(buffer,buffer_u8,9); //ready
    buffer_write(buffer,buffer_bool,false);
    network_send_packet(socket,buffer,buffer_tell(buffer));
}*/
//scr_endTeam(buffer,socket);
if(global.connected) {
	node_send(buffer,"eventName","Disconnect","Num",index)
	network_destroy(socket);
}
global.connected = false;
global.game = 0;
loadoutPicking = false;