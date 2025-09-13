/// @description Send player stats
if(instance_exists(standoff_player)) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 3);
    buffer_write(buffer, buffer_u8, standoff_player.num);
    buffer_write(buffer, buffer_u16, standoff_player.x);
    buffer_write(buffer, buffer_u16, standoff_player.y);
    buffer_write(buffer, buffer_u8, round(standoff_player.image_angle/2));
	dir = point_direction(standoff_player.x,standoff_player.y,obj_reticle.x,obj_reticle.y);
	buffer_write(buffer, buffer_u8, round(dir/2));
    network_send_packet(socket, buffer, buffer_tell(buffer));
}