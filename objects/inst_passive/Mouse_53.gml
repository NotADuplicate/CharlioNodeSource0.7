/// @description Unselect
if(global.shop && global.shopState == "Passives" && active) {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x-1000;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y-4200;
	if(mouse_x < xp + 40 && mouse_x > xp - 40 && mouse_y < yp + 40 && mouse_y > yp-40) {
		
		if(selected == 0) {
			selected = 1
		}
		else if(selected == 1 && global.leveled > 0) {
			global.leveled--;
			global.passiveCount++;
			if(global.passiveCount > 10) {extraStacks++;
			} else { stacks++;}
			
			with(ball_game) {
				node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",5,"Ability",-1, "PassiveIndex", other.passiveIndex)
			}
			audio_play_sound(snd_buy,1,false)
			if(stacks+extraStacks >= maxStacks) {
				active = false;
			}
		}
		
	}
	else 
		selected = 0;
	clicked = true;
}