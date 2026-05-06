function scr_ball_ammo() {
	global.ammo -= argument[0];
	if(global.upgraded) //upgraded guns use an extra ammo
		global.ammo --;
	with(ball_game) {
		node_send(buffer,"eventName","Ammo","Num",ball_player.num,"Ammo",global.ammo)
	}
}
