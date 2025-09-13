/// @description Use utilities
if(global.ammo > 0 && instance_exists(obj_player)) {
    switch(global.utility) {
        case "mine":
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 7); //bullet
            buffer_write(buffer, buffer_u16, obj_player.x);
            buffer_write(buffer, buffer_u16, obj_player.y);
            buffer_write(buffer, buffer_u16, 0);
            buffer_write(buffer,buffer_u8,obj_mine);
            buffer_write(buffer,buffer_u8,obj_player.num);
            network_send_packet(socket, buffer, buffer_tell(buffer));
            scr_ammo(1);
        break;
        case "heal":
            if(global.ammo > healuse-1) {
                obj_player.hp += 35;
                if(obj_player.hp > obj_player.maxhp) {
                    obj_player.hp = obj_player.maxhp
                }
                scr_ammo(healuse);
                healuse++;
            }
        break;
        case "dash": 
            if(obj_player.spd < 15) {
                obj_player.spd = obj_player.spd * 4;
                global.invincibility = 15;
                alarm[7] = 10;
                scr_ammo(1);
            }
        break;
        case "push":
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 7); //bullet
            buffer_write(buffer, buffer_u16, mouse_x);
            buffer_write(buffer, buffer_u16, mouse_y);
            buffer_write(buffer, buffer_u16, 0);
            buffer_write(buffer,buffer_u8,obj_push);
            buffer_write(buffer,buffer_u8,obj_player.num);
            network_send_packet(socket, buffer, buffer_tell(buffer));
            scr_ammo(1);
        break;
        case "wall":
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 7); //bullet
            dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
            xp = obj_player.x + lengthdir_x(70,dir);
            yp = obj_player.y + lengthdir_y(70,dir);
            buffer_write(buffer,buffer_u16,xp);
            buffer_write(buffer,buffer_u16,yp);
            buffer_write(buffer,buffer_u16,dir);
            buffer_write(buffer,buffer_u8,obj_barrier);
            buffer_write(buffer,buffer_u8,obj_player.num);
            network_send_packet(socket, buffer, buffer_tell(buffer));
            scr_ammo(1);
        break;
        case "airstrike":
            if(global.ammo >1) {
                scr_ammo(2);
                instance_create(mouse_x,mouse_y,player_airstrike);
            }
        break;
        case "reflect":
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 7); //bullet
            dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
            xp = obj_player.x + lengthdir_x(50,dir);
            yp = obj_player.y + lengthdir_y(50,dir);
            buffer_write(buffer,buffer_u16,xp);
            buffer_write(buffer,buffer_u16,yp);
            buffer_write(buffer,buffer_u16,dir);
            buffer_write(buffer,buffer_u8,obj_reflect);
            buffer_write(buffer,buffer_u8,obj_player.num);
            network_send_packet(socket, buffer, buffer_tell(buffer));
            scr_ammo(1);
        break;
    }
}

