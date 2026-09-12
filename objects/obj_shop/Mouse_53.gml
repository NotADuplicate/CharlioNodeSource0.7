/// @description Switch options state
if(global.shop) {
	relativeX = xp + camera_get_view_x(view_camera[0]);
	relativeY = yp + camera_get_view_y(view_camera[0]);
	cancelX = relativeX+670;
	cancelY = relativeY+620;
	confirmX = relativeX+870
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
	} else if(global.pendingLevels > 0 && mouse_x < cancelX+70 && mouse_x > cancelX-70 && mouse_y > cancelY-25 && mouse_y < cancelY+25) {
		with(inst_passive) {
			global.leveled += pendingStacks;
			pendingStacks = 0;
		}
		global.pendingLevels = 0;
	} else if(global.pendingLevels > 0 && mouse_x < confirmX+70 && mouse_x > confirmX-70 && mouse_y > cancelY-25 && mouse_y < cancelY+25) {
		with(inst_passive) {
			repeat(pendingStacks) {
				with(ball_game) {
					node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",5,"Ability",-1, "PassiveIndex", other.passiveIndex)
				}
			}
			pendingStacks = 0;
		}
		global.pendingLevels = 0;
		audio_play_sound(snd_buy,1,false)
	}
}