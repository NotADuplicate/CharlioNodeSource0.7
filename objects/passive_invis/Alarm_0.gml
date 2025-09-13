/// @description get faster shooting
with(ball_game) {
    /*buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 11);
    buffer_write(buffer, buffer_u8, ball_player.num);
    buffer_write(buffer, buffer_u8, 4);
    network_send_packet(socket, buffer, buffer_tell(buffer));*/
	node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",4)
}
instance_destroy()