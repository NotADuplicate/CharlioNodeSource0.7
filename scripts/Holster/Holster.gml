// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Holster() constructor {
	sprite = spr_holster;
	cooldown = 1; 
	ammoCost = 1;
	name = "Holster"
	abilityName = "holster"
	text = "Switches between the two primary attacks you have equipped"
	
	
	static abilityPressed = function(buffer) {
		scr_ball_ammo(1);
		var switching = global.holster
		global.holster = global.attack
		global.attack = switching;
		with(ball_game) {
			node_send(buffer,"eventName","Extra Shit 2","Gun Name",scr_gun_name(global.attack), "Gun Num", ball_player.num);
		}
	}
}