/// @description Do minigun things
if(timer < 250)
    timer++;
if(global.stun != 0) {
	timer = 0;
}
if(global.attack == obj_minigun && timer > 1 && global.shop == false && global.stun == 0 && ball_player.jam == 0) {
    if(revving == 0) {
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
		else if(global.ammo > minigunAmmo){
			totalspray = 15;
			minigunAmmo += .15;
			scr_ball_ammo(round(minigunAmmo))
		}
    } 
	else {
		revving--;
		if(revving = 0)
			minigunAmmo = 1;
	}
}
