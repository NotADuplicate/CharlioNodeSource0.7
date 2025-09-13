/// @description Send ball position
/*alarm[7] = 10;
if(global.lastTouch == obj_client.index) {
	with(ball_game) {
	    /*buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 25);
	    buffer_write(buffer, buffer_u16, obj_bigBall.x)//+obj_bigBall.hspeed);
	    buffer_write(buffer, buffer_u16, obj_bigBall.y)//+obj_bigBall.vspeed);
		network_send_packet(socket, buffer, buffer_tell(buffer));*/
		
		
		/*var data = ds_map_create();
		data[? "eventName"] = "Ball Pos"
		data[? "X"] = obj_bigBall.x
		data[? "Y"] = obj_bigBall.y
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_text,json_encode(data))
		network_send_packetudp(socket,buffer,buffer_tell(buffer))
		node_send(buffer,"eventName","Ball Pos","X",obj_bigBall.x,"Y",obj_bigBall.y)
	}
}