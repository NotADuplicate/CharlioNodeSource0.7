function scr_shoot() {
	show_message("Scr shoot got called for some reason wtf")
	if(instance_exists(obj_player)) {
	    dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
	    xp = obj_player.x + lengthdir_x(15,dir);
	    yp = obj_player.y + lengthdir_y(15,dir);
	    buffer = shooter_game.buffer;
	    buffer_seek(buffer, buffer_seek_start, 0);
	    buffer_write(buffer, buffer_u8, 7); //bullet
	    buffer_write(buffer, buffer_u16, xp);
	    buffer_write(buffer, buffer_u16, yp);
	    buffer_write(buffer,buffer_u16,round(dir));
	    buffer_write(buffer,buffer_u8,global.attack);
	    buffer_write(buffer,buffer_u8,obj_player.num);
	    //global.ammo--;
	    network_send_packet(obj_client.socket,buffer,buffer_tell(buffer));
	}



}
