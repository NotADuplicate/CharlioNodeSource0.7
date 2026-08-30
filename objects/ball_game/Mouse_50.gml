/// @description Do minigun things
if(timer < 250)
    timer++;
if(global.stun != 0) {
	timer = 0;
}
if(ball_player.quickTap > 0 && global.attack != other_bolt) {
	if(global.attack == obj_grenade) {
	    if(global.ammo > 0 && reload == 0 && scr_shootable()) {
		
	        xp = obj_player.x + lengthdir_x(35,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y));
	        yp = obj_player.y + lengthdir_y(35,point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)); 
			dir = round(point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
			var ob = obj_grenade;
			if(global.upgraded) {ob = upgraded_grenade;}
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp,"Y",yp,"Dir",dir,"Obj",ob,"Timer",1)
		
		
			reload = 6;
	        scr_ball_ammo(1);
	    }
	} else {
		scr_primary_fire();
	}
}
var dt = delta_time / 30000;
if(global.attack == obj_minigun && timer > 1 && scr_shootable()) {
    if(revving <= 0) {
		if(totalspray > 0) {
			repeat(global.shooting) {
				scr_ball_shoot();
				totalspray--;
			    with(ball_player) { //get pushed
			        dir = point_direction(mouse_x,mouse_y,x,y);
			        if(ball_player.knockback = 1) {
			            len = 2;
			        }
					else
						len = 8;
					if(global.pushSpd > 1)
						len *= 1.5;
					scr_player_move(dir,.75)
					if(global.upgraded) {
						scr_player_move(dir,.75)
						len *= 2;
					}
					if(ball_player.speed > len)
						ball_player.speed = len
			    }
			}
		}
		else if(global.ammo >= minigunAmmo){
			totalspray = 10;
			minigunAmmo += 0//.15;
			scr_ball_ammo(round(minigunAmmo))
		}
    } 
	else {
		if(ball_player.quickTap > 0) {
			revving -= global.shooting*dt*4;
		} else {
			revving -= global.shooting*dt;
		}
		if(revving = 0)
			minigunAmmo = 1;
	}
}
