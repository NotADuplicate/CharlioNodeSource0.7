/// @description Insert description here
// You can write your code in this editor
if(global.shop && global.shopState == "Abilities" && global.utilityHeld) {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	if(mouse_x < xp + 16 && mouse_x > xp - 16 && mouse_y < yp + 16 && mouse_y > yp-16) {
		if(global.utilitySwapHeld) {
			if(global.utilityClass == global.Q) {
				global.Q = global.space;
				global.space = global.utilityClass;
			}
			if(global.utilityClass == global.right) {
				global.right = global.space;
				global.space = global.utilityClass;
			}
			if(global.utilityClass == global.R) {
				global.R = global.space;
				global.space = global.utilityClass;
			}
		}
		
		if(global.utilityClass != global.Q && global.utilityClass != global.space && global.utilityClass != global.right && global.utilityClass != global.R) {
			if(global.space == 0)
				global.leveled--;
			else if(global.free > 0)
				global.leveled--;
			else
				global.free = 60;
			if(global.leveled = -1) {
				global.leveled = 0;
			} else {
				global.space = global.utilityClass;
				with(ball_game) {
					node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",3,"Ability",global.space.abilityIndex)
				}
				ball_player.spaceCoolMax = 0;
				audio_play_sound(snd_buy,1,false)
				i = 0;
				repeat(9) {
					global.statSource[2,i] = variable_global_get(global.stat[i])
					i++;
				}
			}
		}
	}
}