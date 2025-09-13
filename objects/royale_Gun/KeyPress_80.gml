/// @description Pick up gun
if(place_meeting(x,y,ball_player)) {
	peen = global.attack;
	global.attack = atk;
	atk = peen;
}