// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Resistance() constructor {
	text = "Take 20% less damage from abilities"
	sprite = spr_spellShield;
	maxStacks = 4;
	type = "Defense"
	
	stats = new AbilityStats();
	stats.resistance = 1;
	
	static passiveGet = function(buffer) {
		global.resistance *= 1.275
	}
	
	static passiveLose = function(buffer) {
		global.resistance /= 1.275
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}