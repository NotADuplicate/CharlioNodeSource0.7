/// @description Insert description here
// You can write your code in this editor
//move_bounce_all(true)
/*if(obj_client.index == 1) {
	with(ball_game) {
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 10);
		buffer_write(buffer,buffer_u8, 1);
		obj_bigBall.direction = round(obj_bigBall.direction);
		obj_bigBall.speed = round(obj_bigBall.speed);
		buffer_write(buffer,buffer_u16,obj_bigBall.direction);
		buffer_write(buffer,buffer_u8,obj_bigBall.speed);
		network_send_packet(socket, buffer, buffer_tell(buffer));
	}
}