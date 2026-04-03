/// @description Insert description here
// You can write your code in this editor
if(global.attack != atk) {
	global.holster = global.attack
	global.attack = atk;
	global.atktext = scr_gun_name(atk)

	with(ball_game) {
		node_send(buffer,"eventName","Gun Picked","Gun Name",global.atktext, "Num", ball_player.num);
	}
}