function scr_grenade() {
		    dir = point_direction(pirate_player.x,pirate_player.y,mouse_x,mouse_y);
		    xp = pirate_player.x + lengthdir_x(15,dir);
		    yp = pirate_player.y + lengthdir_y(15,dir);
		    buffer = obj_client.buffer;
		    buffer_seek(buffer, buffer_seek_start, 0);
		    buffer_write(buffer, buffer_u8, 7); //bullet
		    buffer_write(buffer, buffer_u16, xp);
		    buffer_write(buffer, buffer_u16, yp);
		    buffer_write(buffer,buffer_u16,round(dir));
		    buffer_write(buffer,buffer_u16,global.grenade);
		    buffer_write(buffer,buffer_u8,pirate_player.num);
		    //global.ammo--;
		    network_send_packet(obj_client.socket,buffer,buffer_tell(buffer));


}
