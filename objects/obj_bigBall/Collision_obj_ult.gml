/// @description Activate ult from ammo
switch(global.ult) {
    case "Big Gun":
        global.BFG = global.attack;
        global.attack = obj_BFG;
        scr_ammo(-1);
    break;
    case "Ammo":
        scr_ammo(-10);
    break;
    case "Sicko Mode":
        global.shooting = global.shooting * 30;
        spd = spd * 1.5;
        alarm[4] = 300;
        scr_ammo(-3);
    break;
    case "Win":
        buffer_seek(obj_client.buffer,buffer_seek_start,0);
        buffer_write(obj_client.buffer,buffer_u8,11);
        buffer_write(obj_client.buffer,buffer_u8,num);
        network_send_packet(obj_client.socket,obj_client.buffer,buffer_tell(obj_client.buffer))
    break;
    case "Danger Zone":
        buffer_seek(obj_client.buffer,buffer_seek_start,0);
        buffer_write(obj_client.buffer,buffer_u8,10);
        buffer_write(obj_client.buffer,buffer_u8,num);
        network_send_packet(obj_client.socket,obj_client.buffer,buffer_tell(obj_client.buffer))
    break;
}

