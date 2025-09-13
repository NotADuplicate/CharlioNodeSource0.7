/// @description Shoot
if(instance_exists(standoff_player)) {
	if(loaded) {
		loaded = false;
		obj_reticle.sprite_index = reticle_cooldown;
		buffer_seek(buffer,buffer_seek_start,0);
		buffer_write(buffer,buffer_u8,7) //bullet
		xp = standoff_player.x;
		yp = standoff_player.y;
		dir = point_direction(xp,yp,obj_reticle.x,obj_reticle.y);
		dir += random_range(-global.aim*8,global.aim*8);
	    buffer_write(buffer, buffer_u16, xp);
	    buffer_write(buffer, buffer_u16, yp);
	    buffer_write(buffer,buffer_u16,round(dir));
	    buffer_write(buffer,buffer_u8,standoff_player.num);
		network_send_packet(socket,buffer,buffer_tell(buffer))
		alarm[0] = 60/global.firing;
		global.aim = 2.5;
	}
}