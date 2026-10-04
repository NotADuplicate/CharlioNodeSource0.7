/// @description Unselect
if(room == room1) { //get for rumble mode
	if(mouse_x < x + 40 && mouse_x > x - 40 && mouse_y < y + 40 && mouse_y > y-40) {
		obj_client.rumblePicking = "Passive";
		if(selected == 0) {
			selected = 1
		}
		else if(selected == 1) {
			with(obj_client) {
				node_send(buffer,"eventName","Rumble Select","Num",obj_client.index,"type","Passive","Index",other.passiveIndex)
			}
			audio_play_sound(snd_buy,1,false)
		}
	}
	else 
		selected = 0;
	clicked = true;
}
else if(global.shop && global.shopState == "Passives" && active) {
	xp = camera_get_view_x(view_camera[0])+obj_shop.xp+x-1000;
	yp = camera_get_view_y(view_camera[0])+obj_shop.yp+y-4200;
	if(mouse_x < xp + 40 && mouse_x > xp - 40 && mouse_y < yp + 40 && mouse_y > yp-40) {
		global.selectedOption = "PASSIVE";
		global.selectedPassive = Passives.list[passiveIndex];
		global.selectedPassive.stacks = stacks;
		if(selected == 1 && global.instantConfirm) {
			audio_play_sound(snd_buy,1,false)
			
			with(ball_game) {
				node_send(buffer,"eventName","Loadout","Num",ball_player.num,"Slot",5,"Ability",-1, "PassiveIndex", global.selectedPassive.passiveIndex)
			}
			if(global.testMode) {
				global.leveled--;
			}
			global.selectedPassive.stacks++;
		}
		selected = 1;
		clicked = true;	
	} else {
		selected = 0;
	}
} else {
	selected = 0;
}