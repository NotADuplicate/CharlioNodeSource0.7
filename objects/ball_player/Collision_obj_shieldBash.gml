/// @description Stun
if(other.num != num && global.invincibility == 0) {
	scr_player_move(other.direction,8)
	if(global.teamNum[other.num] != global.teamNum[num]) {
		with(ball_game) {
			node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"Status Num",20,"User",40)
		}
		scr_damage(70,other.num,false)
	}
	global.invincibility = 5;
}

/*if(other.num != num && global.invincibility == 0) {
	scr_player_move(other.direction,8)
	if(global.teamNum[other.num] != global.teamNum[num]) {
		with(ball_game) {
		    buffer_seek(buffer, buffer_seek_start, 0);
		    buffer_write(buffer, buffer_u8, 11);
		    buffer_write(buffer, buffer_u8, ball_player.num);
		    buffer_write(buffer, buffer_u8, 22);
		    network_send_packet(socket, buffer, buffer_tell(buffer));
		}
		scr_damage(40,other.num,false)
	}
	global.invincibility = 5;
}
