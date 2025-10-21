// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AmmoRegen() constructor {
	text = "Increase ammo regen"
	sprite = spr_ammoRegen;
	maxStacks = 3;
	type = "Resources"
	
	static passiveGet = function(buffer) {
		global.ammoRegen += 0.35;
	}
	
	static passiveLose = function(buffer) {
		global.ammoRegen -= 0.35;
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}