/// @description Decide if seen
if(global.teamNum[num] == global.teamNum[ball_player.num] || position_meeting(x,y,obj_cover) == false)
	seen = true;
else {
	cov = instance_position(x,y,obj_cover)
	if(cov.seen = false)
		seen = false
	else
		seen = true
}