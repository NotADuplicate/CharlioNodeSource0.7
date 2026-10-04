// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Plasma() constructor {
	sprite = spr_darkness
	text = "Hitting enemies with weapon attacks applies 1 seconds of plasma"
	maxStacks = 2;
	type = "Offense"
	name = "Plasma Shots"
	
	static passiveGet = function(buffer) {

	}
	
	static passiveLose = function(buffer) {

	}
	
	static otherGet = function(num) {
		global.players[num].firePassive += 1;
	}
	
	static otherLose = function(num) {
		global.players[num].firePassive -= 1;
	}
}