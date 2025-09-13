///Throw grenade
if(instance_exists(pirate_player)) {
	switch(global.grenade) {
		case obj_scan:
		case obj_lock:
		    buffer_seek(buffer, buffer_seek_start, 0);
		    buffer_write(buffer, buffer_u8, 7); //bullet
		    buffer_write(buffer, buffer_u16, mouse_x);
		    buffer_write(buffer, buffer_u16, mouse_y);
		    buffer_write(buffer,buffer_u16,0);
		    buffer_write(buffer,buffer_u16,global.grenade);
		    buffer_write(buffer,buffer_u8,pirate_player.num);
		    //global.ammo--;
		    network_send_packet(obj_client.socket,buffer,buffer_tell(buffer));
		break;
		case obj_stun:
			scr_grenade();
		break;
		case obj_stun1:
			scr_grenade();
		break;
	}
	global.grenade = 0;
}