/// @description Switch options state
if(global.shop) {
	relativeX = xp + camera_get_view_x(view_camera[0]);
	relativeY = yp + camera_get_view_y(view_camera[0]);
	cancelY = relativeY+360;
	confirmX = relativeX+765
	if(mouse_y > relativeY && mouse_y < relativeY+90 && mouse_x > relativeX && mouse_x < relativeX + 950) {
		if(mouse_x < relativeX + 470) {
			if(global.shopState != "Abilities") {
				wipe = true;
				global.shopState = "Abilities";
				with(inst_utility) {
					drawOnce = 2;
				}
			}
		}
		else if(global.shopState != "Passives") {
			wipe = true;
			global.shopState = "Passives";
		}
	} else if(mouse_x < confirmX+155 && mouse_x > confirmX-155 && mouse_y > cancelY-25 && mouse_y < cancelY+25) {
		if(global.selectedOption == "PASSIVE") {
			if(global.selectedPassive.stacks >= global.selectedPassive.maxStacks || global.leveled <= 0) {
				return;
			}
			global.levelSpent = 12;
			audio_play_sound(snd_buy,1,false)
			
			with(ball_game) {
				node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",5,"Ability",-1, "PassiveIndex", global.selectedPassive.passiveIndex)
			}
			if(global.testMode) {
				global.leveled--;
			}
			global.selectedPassive.stacks++;
		}
	}
}