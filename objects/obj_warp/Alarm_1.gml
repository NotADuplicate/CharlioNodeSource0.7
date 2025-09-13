/// @description Change color for team
if(global.teamNum[num] = -1)
	sprite_index = spr_blueWarp
else
	sprite_index = spr_redWarp
	
active = true;
if(global.teamNum[num] == global.teamNum[ball_player.num]) {
	sameTeam = true;
	layer = layer_create(-1000)
}
else
	sameTeam = false;