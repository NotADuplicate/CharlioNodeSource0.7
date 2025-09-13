   /// @description If clicked then swap out Q
if(global.shop && global.shopState == "Abilities" && global.utilityHeld) {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	if(mouse_x < xp + 16 && mouse_x > xp - 16 && mouse_y < yp + 16 && mouse_y > yp-16) {
		if(global.utilitySwapHeld) {
			if(global.utilityClass == global.right) {
				global.right = global.Q;
				global.Q = global.utilityClass;
			}
			if(global.utilityClass == global.space) {
				global.space = global.Q;
				global.Q = global.utilityClass;
			}
			if(global.utilityClass == global.R) {
				global.R = global.Q;
				global.Q = global.utilityClass;
			}
		}
		
		if(global.utilityClass != global.Q && global.utilityClass != global.space && global.utilityClass != global.right && global.utilityClass != global.R) {
			if(global.Q == 0) {
				global.leveled--;
			} else {
				if(global.free > 0)
					global.leveled--;
				else
					global.free = 60;
			}
			if(global.leveled = -1) {
				global.leveled = 0;
			} else {
				global.Q = global.utilityClass;
				with(ball_game) {
					node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",2,"Ability",global.Q.abilityIndex)
				}
				ball_player.QCoolMax = 0;
				audio_play_sound(snd_buy,1,false)
				i = 0;
				repeat(9) {
					global.statSource[0,i] = variable_global_get(global.stat[i])
					i++;
				}
			}
		}

	}
}