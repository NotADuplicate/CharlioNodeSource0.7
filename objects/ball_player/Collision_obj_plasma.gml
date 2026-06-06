if(global.teamNum[other.num] != global.teamNum[num] || other.num == num) {
	scr_damage(100,other.num,false,spr_plasmaBomb,false);
	scr_player_move(point_direction(other.x,other.y,x,y),22);
	if(global.invincibility == 0) {
		with(ball_game) { //send plasma passive
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",60);
		}
		magicBurnNum = other.num;
	}
}