// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_blockDie(num1){

		with(block_other) {
			if(num == num1) {
				instance_destroy()
			}
		}
	}