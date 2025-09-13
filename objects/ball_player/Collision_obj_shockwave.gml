/// @description Get stunned and knockedback
if(global.teamNum[other.num] != global.teamNum[num]) {
	scr_player_move(point_direction(other.x,other.y,x,y),9)
	stunNum = other.num
	with(ball_game) {
		node_send(buffer, "eventName", "Targeted Status", "Target", ball_player.num, "User", other.stunNum, "Status Num", 22)
	}
	global.invincibility = 1;
}