if(serverSendDamage > 0) {
	dmgNum = ball_player.num;
	if(global.aiControl[num]) {
		dmgNum = num; 
	}
	with(ball_game) { //send monster damage
		node_send(buffer,"eventName","Monster Dmg","Num",other.nameNum,"Dmg",other.serverSendDamage,"Damager",other.dmgNum)
	}
	serverSendDamage = 0;
}
alarm[9] = 1;