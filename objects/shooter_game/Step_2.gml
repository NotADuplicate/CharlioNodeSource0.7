/// @description Spray minigun
/*if(spray > 0) {
	repeat(totalspray) {
		spray -= 1;
		if(extra) { //only shoot every other shot
			scr_shoot();
			extra = false
		}
		else
			extra = true
	}
    with(obj_player) {
        dir = point_direction(mouse_x,mouse_y,x,y);
        if(global.passive == "Juggernaut") {
            len = 8;
        }
        else {
            len = 16;
        }
            x += lengthdir_x(len,dir);
            y += lengthdir_y(len,dir);
        if(other.spray == 1)
            motion_set(dir,len);
    }
}*/

///Send player stats
if(instance_exists(obj_player)) {
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, 3);
    buffer_write(buffer, buffer_u8, obj_player.num);
    buffer_write(buffer, buffer_u16, obj_player.x);
    buffer_write(buffer, buffer_u16, obj_player.y);
    buffer_write(buffer, buffer_u8, obj_player.hp);
    network_send_packet(socket, buffer, buffer_tell(buffer));
}

///Reload
if(reload > 0)
    reload-= global.shooting;
if(reload <0)
    reload = 0;

