function scr_endTeam(argument0, argument1) {
	buffer = argument0;
	socket = argument1;
	buffer_seek(buffer,buffer_seek_start,0);
	buffer_write(buffer,buffer_u8,21);
	buffer_write(buffer,buffer_bool,global.teamside);
	network_send_packet(socket,buffer,buffer_tell(buffer));


}
