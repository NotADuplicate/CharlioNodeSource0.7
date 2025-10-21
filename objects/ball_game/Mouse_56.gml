/// @description Fire grenade
if(global.attack == obj_grenade && instance_exists(ball_player) && global.throwRange <= 0) {
	//game_end()
    if(global.ammo > 0 && global.shop == false && global.stun == 0 && reload == 0 && ball_player.jam == 0) {
        /*buffer_seek(buffer, buffer_seek_start, 0);
        buffer_write(buffer, buffer_u8, 7); //bullet   
        xp = obj_player.x + lengthdir_x(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
        yp = obj_player.y + lengthdir_y(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
        buffer_write(buffer, buffer_u16, xp);
        buffer_write(buffer, buffer_u16, yp);
        buffer_write(buffer,buffer_u16,round(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)));
        buffer_write(buffer,buffer_u16,global.attack);
        buffer_write(buffer,buffer_u8,obj_player.num);
        buffer_write(buffer,buffer_u8,timer);
        network_send_packet(socket,buffer,buffer_tell(buffer));*/
		
        xp = obj_player.x + lengthdir_x(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
        yp = obj_player.y + lengthdir_y(40,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
		dir = round(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
		var ob = obj_grenade;
		if(global.upgraded) {ob = upgraded_grenade;}
		node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp,"Y",yp,"Dir",dir,"Obj",ob,"Timer",timer)
		
		
		reload = 6;
        scr_ball_ammo(1);
    }
    global.slow = 1;
}
timer = 0;

///Spray minigun
if(global.attack == obj_minigun && instance_exists(obj_player)) {
    spray = backlog;
    backlog = 0;
    global.slow = 1;
	node_send(buffer, "eventName", "Status", "Target", ball_player.num, "Status Num", 58);
}

///Fire BFG
if(global.attack == obj_BFG && global.shop == false) {
    scr_ball_shoot();
    global.attack = global.BFG;
}