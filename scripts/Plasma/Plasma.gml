// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Plasma() constructor {
	sprite = spr_darkness
	text = "Hitting enemies with basic attacks applies 1.5 seconds of plasma"
	maxStacks = 1;
	type = "Offense"
	
	static passiveGet = function(buffer) {

	}
	
	static passiveLose = function(buffer) {

	}
	
	static otherGet = function(num) {
		global.players[num].firePassive = true;
	}
	
	static otherLose = function(num) {
		global.players[num].firePassive = false;
	}
}