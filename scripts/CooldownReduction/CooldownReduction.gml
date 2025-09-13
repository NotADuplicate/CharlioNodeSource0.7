// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CooldownReduction() constructor {
	text = "Faster Ability Cooldowns"
	sprite = spr_clock;
	maxStacks = 3;
	type = "Resources"
	
	static passiveGet = function(buffer) {
		global.coolReduc *= 1.3
	}
	
	static passiveLose = function(buffer) {
		global.coolReduc /= 1.3
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}