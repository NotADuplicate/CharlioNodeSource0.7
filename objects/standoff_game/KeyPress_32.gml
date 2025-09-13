/// @description Send *Click*
if(instance_exists(standoff_player) && obj_reticle.minimum != 0) {
		buffer_seek(buffer,buffer_seek_start,0);
		buffer_write(buffer,buffer_u8,10) //click noise
		buffer_write(buffer,buffer_u8,obj_client.index);
		network_send_packet(socket,buffer,buffer_tell(buffer));
}