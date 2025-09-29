   /// @description If clicked then swap out Q
if(global.shop && global.shopState == "Abilities" && global.utilityClass != "") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	
	//drag other slot to swap
	if(mouse_x < xp + 18 && mouse_x > xp - 18 && mouse_y < yp + 18 && mouse_y > yp-18) {
		if(global.utilitySwapHeld) {
			if(global.utilityClass == global.right) {
				global.right = variable_global_get(abilityVar);
				variable_global_set(abilityVar, global.utilityClass);
			}
			if(global.utilityClass == global.space) {
				global.space = variable_global_get(abilityVar);
				variable_global_set(abilityVar, global.utilityClass);
			}
			if(global.utilityClass == global.R) {
				global.R = variable_global_get(abilityVar);
				variable_global_set(abilityVar, global.utilityClass);
			}
			if(global.utilityClass == global.Q) {
				global.Q = variable_global_get(abilityVar);
				variable_global_set(abilityVar, global.utilityClass);
			}
		}
		
		//Release click to buy new ability
		if(clicked) {
			if(global.utilityClass != global.Q && global.utilityClass != global.space && global.utilityClass != global.right && global.utilityClass != global.R) {
				if(variable_global_get(abilityVar) == 0) {
					global.leveled--;
				} else {
					if(global.free > 0)
						global.leveled--;
					else
						global.free = 60;
				}
				if(global.leveled < 0) {
					global.leveled = 0;
				} else {
					variable_global_set(abilityVar, global.utilityClass);
					with(ball_game) {
						node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",other.slot,"Ability",variable_global_get(other.abilityVar).abilityIndex)
					}
					audio_play_sound(snd_buy,1,false)
				}
			}
			global.levelSpent = 12;
		}
	}
}
clicked = false;