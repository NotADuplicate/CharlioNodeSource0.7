///Shoot bullet (switch)
ball_player.ninja = 0;
timer = 0;
shootable = global.throwRange <= 0;
with(ball_player) {
	if(keyboard_check(global.mapKey)) {
		if(place_meeting(x,y,obj_warp)) {
			show_debug_message("Standing on warp");
			other.shootable = false;
		}
	}
}
if((global.ammo > 0 || global.attack = obj_bullet || global.attack = chad_bullet) && global.options == false && instance_exists(ball_player) && reload == 0 && held == false && global.shop == false && global.stun == 0 && ball_player.jam == 0 && shootable) {
	held = false;
    switch(global.attack) {
        case obj_melee:
            scr_ball_shoot();
            reload = 30;
            scr_ball_ammo(1);
			scr_player_move(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),7);
			if(global.upgraded)
				scr_player_move(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),7);
        break;
        case virgin_bullet:
            scr_ball_shoot();
            reload = 30;
            scr_ball_ammo(1);
			global.chargeGun++;
			if(global.chargeGun > 2)
				global.attack = chad_bullet
        break;
        case chad_bullet:
            scr_ball_shoot();
            reload = 20;
			global.chargeGun = 0;
			global.attack = virgin_bullet
			scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),14);
			if(global.upgraded)
				scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),14);
        break;
        case obj_curve:
			scr_ball_ammo(1);
            reload = 15;
			//shoot curve
		    dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
		    xp = ball_player.x + lengthdir_x(15,dir);
		    yp = ball_player.y + lengthdir_y(15,dir);
		    buffer = ball_game.buffer;
			node_send(buffer,"eventName","Bullet","X",xp,"Y",yp,"Dir",dir+curving,"Obj",global.attack,"Num",ball_player.num)
			if(curving == 0)
				curving = 360;
			else
				curving = 0;
        break;
        case obj_void:
            scr_ball_shoot();
            reload = 35;
            scr_ball_ammo(1);
			scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),9);
			if(global.upgraded)
				scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),9);
        break;
        case obj_shotgun:
            scr_ball_shoot();
            reload = 55;
            scr_ball_ammo(1);
			if(global.upgraded)
				scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),9);
        break;
        case obj_bullet:
            scr_ball_shoot();
            reload = 25;
			if(global.upgraded)
				scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),5);
        break;
		case obj_ARbullet:
			if(bullets > 0) {
				scr_ball_shoot();
				scr_ball_ammo(1)
				bullets--;
			if(global.upgraded)
				scr_player_move(point_direction(mouse_x,mouse_y,ball_player.x,ball_player.y),5);
			}
		break;
        case other_bolt:
			if(global.ammo > 1) {
				show_debug_message("Sniping");
				node_send(buffer,"eventName","Bolt","Num",ball_player.num,"Shooting",global.shooting, "Upgraded", global.upgraded)
	            ins = instance_create(0,0,player_bolt);
	            ins.num = ball_player.num;
	            scr_ball_ammo(2);
	            reload = 1;
			}
        break;
        case obj_boomerang:
			if(global.ammo > 2) {
	            scr_ball_shoot();
	            reload = 45;
	            scr_ball_ammo(3);
			}
        break;
    }
}
if((global.attack == obj_grenade || global.attack == obj_minigun) && instance_exists(ball_player) && ball_player.jam == 0 && shootable && global.shop == false && global.options == false) {
    global.slow = .5;
    if(global.attack == obj_minigun) {
		revving = 24;
		node_send(buffer, "eventName", "Status", "Target", ball_player.num, "Status Num", 57);
	}
	totalspray = 0;
}

/* */
/*  */
