// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scope() constructor {
	sprite = spr_airstrike;
	text = "Increase primary weapon projectile speed, range, and accuracy"
	maxStacks = 3;
	type = "Offense"
	
	static passiveGet = function(buffer) {
	}
	
	static passiveLose = function(buffer) {
	}
	
	static otherGet = function(num) {
		global.players[num].scope *= 1.17;
		global.players[num].accuracy *= 1.25;
	}
	
	static otherLose = function(num) {
		global.players[num].scope /= 1.17;
		global.players[num].accuracy /= 1.25;
	}
}