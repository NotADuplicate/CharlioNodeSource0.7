/// @description Actually shoot
alarm[0] = 5;
if(global.teamNum[num] != global.teamNum[ball_player.num] && point_distance(x,y,ball_player.x,ball_player.y) < bigRange) {
	scr_damage(12,ball_player.num,true)
}