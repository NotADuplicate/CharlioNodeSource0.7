function scr_ball_ammo() {
	global.ammo -= argument[0];
	if(global.upgraded) //upgraded guns use double ammo
		global.ammo -= argument[0];
	with(ball_game) {
		node_send(buffer,"eventName","Ammo","Num",ball_player.num,"Ammo",global.ammo)
	}
	/*var buff = global.ammobuffer
	buffer_seek(buff,buffer_seek_start,0);
	buffer_write(buff,buffer_u8,23);
	buffer_write(buff,buffer_u8,obj_client.index);
	buffer_write(buff,buffer_s8,-argument[0]);
	buffer_write(buff,buffer_u8,global.ammo);
	network_send_packet(obj_client.socket,buff,buffer_tell(buff));*/
}
