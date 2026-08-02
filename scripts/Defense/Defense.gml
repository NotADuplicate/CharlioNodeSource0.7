// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Defense() constructor {
	text = "Take 20% less damage from attacks"
	sprite = spr_defense;
	maxStacks = 4;
	type = "Defense"
	
	stats = new AbilityStats();
	stats.defense = 1;
	
	static passiveGet = function(buffer) {
		global.defense *= 1.275
	}
	
	static passiveLose = function(buffer) {
		global.defense /= 1.275
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}