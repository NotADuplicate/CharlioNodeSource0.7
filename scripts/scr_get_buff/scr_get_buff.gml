// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_buff(buffType, doubleBuff, duration = 1800){
	switch(buffType) {
		case "Damage":
			if(obj_junglePass.dmg <= 0) {	
				with(ball_game) {
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 11)
				}
				if(doubleBuff) {
					with(ball_game) {
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 11)
					}
				}
			}
			obj_junglePass.dmg = duration;
		break;
		
		case "Ammo":
			if(obj_junglePass.ammo <= 0) {	
				if(doubleBuff)
					global.ammoRegen -= 0.6;
				else
					global.ammoRegen -= 0.3;
			}
			obj_junglePass.ammo = duration;
		break; 
		
		case "Power":
			if(obj_junglePass.pwr <= 0) {
				with(ball_game) {
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 23)
				}
				if(doubleBuff) {
					with(ball_game) {
						node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 23)
					}
				}
			}
			obj_junglePass.pwr = duration;
		break;
		
		case "Speed":
			if(obj_junglePass.spd <= 0) {
				ball_player.moveSpd++;
				if(doubleBuff)
					ball_player.moveSpd++;
			}
			obj_junglePass.spd = duration;
		break;
		
		case "Jungle":
			obj_junglePass.jungle = duration;
		break;
		
		case "Resistance":
			if(obj_junglePass.resistance <= 0) {	
				global.resistance *= 1.25;
				if(doubleBuff)
					global.resistance *= 1.25;
			}
			obj_junglePass.resistance = duration;
		break;
		
		case "Defense":
			if(obj_junglePass.defense <= 0) {	
				global.defense *= 1.25;
				if(doubleBuff)
					global.defense *= 1.25;
			}
			obj_junglePass.defense = duration;
		break;
	}
}