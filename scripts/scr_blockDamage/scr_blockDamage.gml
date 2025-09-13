// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_blockDamage(argument0,argument1){
	if(argument0 == obj_client.index) {
		block_player.hp = argument1
		if(block_player.hp < 1)
			block_game.alarm[6] = 1;
	}
	else {
		with(block_other) {
			if(num == argument0) {
				hp = argument1
			}
		}
		with(obj_tower) {
			if(num == argument0) {
				instance_destroy()
			}
		}
	}
}