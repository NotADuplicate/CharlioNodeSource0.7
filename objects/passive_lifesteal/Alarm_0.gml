/// @description get more mana
ball_player.lifeSteal += 0.2
/*with(ball_game) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 11);
    buffer_write(buffer, buffer_u8, ball_player.num);
    buffer_write(buffer, buffer_u8, 42);
    network_send_packet(socket, buffer, buffer_tell(buffer));
}*/