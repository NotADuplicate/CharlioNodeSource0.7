/// @description Insert description here
// You can write your code in this editor
if(global.attack != atk) {
	show_debug_message("Passive count")
	show_debug_message(instance_number(inst_passive))
	global.holster = global.attack
	global.attack = atk;
	global.atktext = scr_gun_name(atk)

	with(ball_game) {
		node_send(buffer,"eventName","Gun Picked","Gun Name",global.atktext, "Num", ball_player.num);
	}
}