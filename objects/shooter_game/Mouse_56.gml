/// @description Fire grenade
if(global.attack == obj_grenade && instance_exists(obj_player)) {
    if(global.ammo > 0) {
        buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 7); //bullet   
        xp = obj_player.x + lengthdir_x(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
        yp = obj_player.y + lengthdir_y(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
        buffer_write(buffer, buffer_u16, xp);
        buffer_write(buffer, buffer_u16, yp);
        buffer_write(buffer,buffer_u16,round(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)));
        buffer_write(buffer,buffer_u8,global.attack);
        buffer_write(buffer,buffer_u8,obj_player.num);
        buffer_write(buffer,buffer_u8,timer);
        network_send_packet(socket,buffer,buffer_tell(buffer));
        scr_ammo(1);
    }
    obj_player.spd = obj_player.spd*2;
}
timer = 0;

///Spray minigun
if(global.attack == obj_minigun && instance_exists(obj_player)) {
    spray = backlog;
    backlog = 0;
    obj_player.spd = obj_player.spd*2;
}

///Fire BFG
if(global.attack == obj_BFG) {
            scr_shoot();
            global.attack = global.BFG;
}

