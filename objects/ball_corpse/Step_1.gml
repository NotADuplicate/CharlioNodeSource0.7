/// @description Be revived
if(reviving != noone) {
	if(point_distance(x,y,reviving.x,reviving.y) > 200) {
		reviving = noone;
	} else {
		indexChangePerSecond = 100 / Abilities.revive.duration;
		indexChangePerTick = indexChangePerSecond * delta_time / 33333;
		index -= (1+indexChangePerTick)*global.teamNum[num];
	}
}