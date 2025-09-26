// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FourthAbility() constructor {
	text = "Get a fourth ability slot"
	sprite = spr_4;
	maxStacks = 1;
	type = "Utility"
	
	static passiveGet = function(buffer) {
		instance_create(select_space.x+94,select_space.y,select_R);
	}
	
	static passiveLose = function(buffer) {
		with(select_R) {
			instance_destroy();
		}
		global.R = 0;
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}