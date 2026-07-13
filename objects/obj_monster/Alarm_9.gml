if(serverSendDamage > 0) {
	with(ball_game) { //send monster damage
		node_send(buffer,"eventName","Monster Dmg","Num",other.nameNum,"Dmg",other.serverSendDamage,"Damager",ball_player.num)
	}
	serverSendDamage = 0;
}
alarm[9] = 1;