/// @description If clicked then swap out Q
if(room != room1 && global.shop && global.shopState == "Abilities") {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y;
	
	//drag other slot to swap
	if(mouse_x < xp + 18 && mouse_x > xp - 18 && mouse_y < yp + 18 && mouse_y > yp-18) {
		if(global.utilityClass = "") {
			global.utilityClass = variable_global_get(abilityVar);
			global.keepUtility = true;
			clicked = false;
			return;
		}
		if(global.utilitySwapHeld || clicked) {
			swappedSlot = 0;
			if(global.utilityClass == global.right) {
				//global.right = variable_global_get(abilityVar);
				//variable_global_set(abilityVar, global.utilityClass);
				swappedSlot = 1;
			} else if(global.utilityClass == global.space) {
				//global.space = variable_global_get(abilityVar);
				//variable_global_set(abilityVar, global.utilityClass);
				swappedSlot = 3;
			} else if(global.utilityClass == global.R) {
				//global.R = variable_global_get(abilityVar);
				//variable_global_set(abilityVar, global.utilityClass);
				swappedSlot = 4;
			} else if(global.utilityClass == global.Q) {
				//global.Q = variable_global_get(abilityVar);
				//variable_global_set(abilityVar, global.utilityClass);
				swappedSlot = 2;
			}
			if(swappedSlot == slot) { 
				clicked = false;
				global.utilityClass = "";
				return; 
			}
			if(swappedSlot > 0) {
				with(ball_game) {
					node_send(buffer,"eventName","Loadout Swap","Num",ball_player.num,"Slot1",other.slot,"Slot2",other.swappedSlot)
				}
				clicked = false;
				global.utilityClass = "";
				return;
			}
		}
		
		//Release click to buy new ability
		if(clicked) {
			global.keepUtility = true;
			if(variable_global_get(abilityVar) == 0) {
				if(global.testMode)
					global.leveled--;
			} else {
				if(global.free <= 0)
					global.free = 60;
			}
			if(global.leveled < 0) {
				global.leveled = 0;
			} else {
				//variable_global_set(abilityVar, global.utilityClass);
				with(ball_game) {
					node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",other.slot,"Ability",global.utilityClass.abilityIndex)
				}
				audio_play_sound(snd_buy,1,false)
			}
			global.levelSpent = 12;
		}
	}
}
clicked = false;