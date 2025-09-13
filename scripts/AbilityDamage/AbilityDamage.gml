// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AbilityDamage() constructor {
	sprite = spr_wand
	text = "Increase ability damage by 20%"
	maxStacks = 4;
	type = "Offense"
	
	static passiveGet = function(buffer) {
	}
	
	static passiveLose = function(buffer) {
	}
	
	static otherGet = function(num) {
		global.players[num].magic *= 1.2;
	}
	
	static otherLose = function(num) {
		global.players[num].magic /= 1.2;
	}
}