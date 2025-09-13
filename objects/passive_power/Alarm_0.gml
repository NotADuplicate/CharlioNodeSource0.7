/// @description send damage passive
global.statSource[3,5] += 2;
with(ball_game) {
    /*buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 11);
    buffer_write(buffer, buffer_u8, ball_player.num);
    buffer_write(buffer, buffer_u8, 23);
    network_send_packet(socket, buffer, buffer_tell(buffer));*/
	node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",23)
}
if(ball_player.magic > 1.5)
	instance_destroy();