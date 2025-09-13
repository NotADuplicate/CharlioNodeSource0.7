/*//Shoot bullet
if(global.ammo > 0 && instance_exists(obj_player)) {
    if(reload == 0) {
        dir = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
        if(global.attack != obj_grenade && global.attack != "melee") {
            reload = 30;
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 7); //bullet
            
            if(global.attack == other_bolt) { //bolts spawn on top of player
                buffer_write(buffer, buffer_u16, obj_player.x);
                buffer_write(buffer, buffer_u16, obj_player.y);
            }
            else { //all other bullets spawn in front
                xp = obj_player.x + lengthdir_x(40,dir);
                yp = obj_player.y + lengthdir_y(40,dir);
                buffer_write(buffer, buffer_u16, xp);
                buffer_write(buffer, buffer_u16, yp);
            }
            buffer_write(buffer,buffer_u16,round(dir));
            buffer_write(buffer,buffer_u8,global.attack);
            
            if(global.attack == other_bolt) {
                buffer_write(buffer,buffer_u8,obj_player.num);
                buffer_write(buffer,buffer_u8,global.shooting);
            }
            
            network_send_packet(socket, buffer, buffer_tell(buffer));
            global.ammo--;
            if(global.attack == other_bolt) {
                ins = instance_create(0,0,player_bolt);
                ins.num = obj_player.num;
            }
            if(global.attack == obj_bullet) {
                reload = 20;
            }
        }
    }
    if(global.attack = "melee") {
        obj_player.dmg = obj_player.dmg*100;
        obj_player.alarm[5] = 5;
        global.ammo--;
    }
    if(global.attack == obj_BFG) {
        global.attack = global.BFG;
        with(obj_player) {
            motion_add(other.dir+180,8);
        }
    }
}
if(global.attack == obj_grenade && instance_exists(obj_player)) {
    timer = 0;
    obj_player.spd = obj_player.spd/2;
}

/* */
///Shoot bullet (switch)
timer = 0;
if(global.ammo > 0 && instance_exists(obj_player) && reload == 0) {
    switch(global.attack) {
        case obj_melee:
            scr_shoot();
            reload = 30;
            scr_ammo(1);
        break;
        case obj_shotgun:
            scr_shoot();
            reload = 40;
            scr_ammo(1);
        break;
        case obj_bullet:
            scr_shoot();
            reload = 20;
            if(extra == false) {
                scr_ammo(1);
                extra = true;
            }
            else
                extra = false;
        break;
        case other_bolt:
            buffer_seek(buffer, buffer_seek_start, 0);
            buffer_write(buffer, buffer_u8, 13); //bolt
            buffer_write(buffer,buffer_u8,obj_player.num);
            buffer_write(buffer,buffer_u8,global.shooting);
            /*buffer_write(buffer, buffer_u8, 7); //bullet
            buffer_write(buffer, buffer_u16, obj_player.x);
            buffer_write(buffer, buffer_u16, obj_player.y);
            buffer_write(buffer, buffer_u16, 0);
            buffer_write(buffer, buffer_u8, other_bolt);
            buffer_write(buffer,buffer_u8,obj_player.num);
            buffer_write(buffer,buffer_u8,global.shooting);*/
            network_send_packet(socket, buffer, buffer_tell(buffer));
            ins = instance_create(0,0,player_bolt);
            ins.num = obj_player.num;
            scr_ammo(1);
            reload = 30;
        break;
        case "melee":
            obj_player.dmg = obj_player.dmg*100;
            obj_player.alarm[5] = 5;
            scr_ammo(1);
        break;
        break;
        case obj_boomerang:
            scr_shoot();
            reload = 30;
            scr_ammo(1);
        break;
    }
}
if((global.attack == obj_grenade || global.attack == obj_minigun) && instance_exists(obj_player)) {
    obj_player.spd = obj_player.spd/2;
    reload = 30;
	totalspray = 0;
}

/* */
/*  */
