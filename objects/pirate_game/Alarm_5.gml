///Count booty
global.booty = instance_number(obj_booty);
txt = "There is" + " " + string(global.booty) + " " + "booty on the ship";
alarm[0] = 120;
buffer_seek(buffer,buffer_seek_start,0);
buffer_write(buffer,buffer_u8,19);
buffer_write(buffer,buffer_u8,global.booty);
network_send_packet(socket,buffer,buffer_tell(buffer));