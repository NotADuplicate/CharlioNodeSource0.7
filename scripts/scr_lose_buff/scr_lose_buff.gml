// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lose_buff(buffType, doubleBuff){
	switch(buffType) {
		case "Damage":
			with(ball_game) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 26)
			}
			if(doubleBuff) {
				with(ball_game) {
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 26)
				}
			}
			obj_junglePass.dmg = 0;
		break;
		
		case "Ammo":
			if(doubleBuff)
				global.ammoRegen += 0.6;
			else
				global.ammoRegen += 0.3;
			obj_junglePass.ammo = 0;
		break; 
		
		case "Power":
			with(ball_game) {
				node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 27)
			}
			if(doubleBuff) {
				with(ball_game) {
					node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 27)
				}
			}
		obj_junglePass.pwr = 0;
		break;
		
		case "Speed":
			ball_player.moveSpd--;
			if(doubleBuff)
				ball_player.moveSpd--;
			obj_junglePass.spd = 0;
		break;
		
		case "Resistance":
			global.resistance /= 1.25;
			if(doubleBuff)
				global.resistance /= 1.25;
			obj_junglePass.resistance = 0;
		break;
		
		case "Defense":
			global.defense /= 1.25;
			if(doubleBuff)
				global.defense /= 1.25;
			obj_junglePass.defense = 0;
		break;
	}
}