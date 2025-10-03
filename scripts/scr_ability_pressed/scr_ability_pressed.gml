// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_pressed(type){
	if(global.throwRange > 0) {
		show_debug_message("Dont use ability because throw range");
		return;
	}
	using = true;
	with(ball_player) {
		if(place_meeting(x,y,inst_utility)) {
			ins = instance_nearest(x,y,inst_utility);
			if(point_distance(x,y,ins.x,ins.y) < 20) {
			ins.ability = type;
			ins.alarm[2] = 1;
			other.using = false;
			}
		}
	}
	if(using && variable_global_get(type) != 0) {
	if(variable_global_get(type) == Abilities.hook) {
		held = true
		range = 0;
	}
	if(variable_global_get(type) == Abilities.curse && ball_player.curseCharge > 0) 
		global.stun = 0;
	if(obj_bigBall.drone == ball_player.num && variable_global_get(type) == "Drone") {
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num",48)
		}
	}
	if(global.ammo > 0 && instance_exists(ball_player) && variable_global_get(type + "Cool") == 0 && global.stun == 0 && global.shop == false && global.dead == false && !global.upgraded) {
		var cool = 1;
		class = variable_global_get(type);
		cool = class.abilityPressed(buffer);
		variable_global_set(type + "Cool",cool)
		variable_instance_set(ball_player, type + "CoolMax", cool)
	}
	}
}