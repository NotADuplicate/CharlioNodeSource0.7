// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MoreKB() constructor {
	text = "Take 50% more knockback from all sources"
	sprite = spr_push;
	maxStacks = 1;
	type = "Utility"
	
	static passiveGet = function(buffer) {
		global.pushSpd = 1.5;
	}
	
	static passiveLose = function(buffer) {
		global.pushSpd = 1;
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}