/// @description Regen ammo
alarm[7] = global.ammoRegen; //regen ammo
if(global.attack != obj_minigun || mouse_check_button(mb_left) == false || ball_game.revving > 0) {
	global.ammo += ammoRate
	if(global.ammo > global.maxAmmo)
		global.ammo = global.maxAmmo
	else {
		with(ball_game) {
			node_send(buffer,"eventName","Ammo","Num",ball_player.num,"Ammo",global.ammo)
		}
	}
}