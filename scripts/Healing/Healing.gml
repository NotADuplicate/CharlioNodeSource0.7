// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Healing() constructor {
	sprite = spr_health
	text = "Increase healing given to other players by 50%"
	maxStacks = 1;
	type = "Utility"
	
	static passiveGet = function(buffer) {
	}
	
	static passiveLose = function(buffer) {
	}
	
	static otherGet = function(num) {
		global.players[num].healing = 1.5;
	}
	
	static otherLose = function(num) {
		global.players[num].healing = 1;
	}
}