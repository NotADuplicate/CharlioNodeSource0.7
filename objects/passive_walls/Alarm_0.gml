/// @description send ramming passive
with(ball_game) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 11);
    buffer_write(buffer, buffer_u8, ball_player.num);
    buffer_write(buffer, buffer_u8, 21);
    network_send_packet(socket, buffer, buffer_tell(buffer));
}
instance_destroy()