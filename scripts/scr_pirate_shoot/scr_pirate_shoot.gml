function scr_pirate_shoot(argument0, argument1) {
	if(instance_exists(pirate_player)) {
	    dir = point_direction(pirate_player.x,pirate_player.y,mouse_x,mouse_y);
		dev = argument0;
		shot = argument1;
		dir += irandom_range(-dev,dev)
	    xp = pirate_player.x// + lengthdir_x(5,dir);
	    yp = pirate_player.y// + lengthdir_y(5,dir);
	    buffer = obj_client.buffer;
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 7); //bullet
	    buffer_write(buffer, buffer_u16, xp);
	    buffer_write(buffer, buffer_u16, yp);
	    buffer_write(buffer,buffer_u16,round(dir));
	    buffer_write(buffer,buffer_u16,shot);
	    buffer_write(buffer,buffer_u8,pirate_player.num);
	    //global.ammo--;
	    network_send_packet(obj_client.socket,buffer,buffer_tell(buffer));
	}



}
