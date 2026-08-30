/// @description Fire grenade
if(global.attack == obj_grenade && global.slow < 1) {
    if(global.ammo > 0 && reload == 0 && scr_shootable()) {
		
        xp = obj_player.x + lengthdir_x(35,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
        yp = obj_player.y + lengthdir_y(35,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
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
if(global.attack == obj_minigun && instance_exists(ball_player)) {
    spray = backlog;
    backlog = 0;
	revving = 100
    global.slow = 1;
	node_send(buffer, "eventName", "Status", "Target", ball_player.num, "Status Num", 58);
	with(obj_gun) {
		if(num == ball_player.num) {
			revving = false;
		}
	}
}

///Fire BFG
if(global.attack == obj_BFG && global.shop == false) {
    scr_ball_shoot();
    global.attack = global.BFG;
}