/// @description Send ball position to prevent desync
// You can write your code in this editor
/*if(global.lastTouch) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 27);
    buffer_write(buffer, buffer_u16, obj_bigBall.x);
    buffer_write(buffer, buffer_u16, obj_bigBall.y);
    network_send_packet(socket, buffer, buffer_tell(buffer));
	//instance_create(512,100,sent_marker);
	alarm[10] = 60;
}