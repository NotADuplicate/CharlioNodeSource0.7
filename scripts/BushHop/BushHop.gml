// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BushHop() constructor {
	sprite = spr_bush
	text = "Press against a wall while in a bush to hop over it"
	maxStacks = 1;
	type = "Utility"
	
	static passiveGet = function(buffer) {
		ball_player.bushHop = true
	}
	
	static passiveLose = function(buffer) {
		ball_player.bushHop = false
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}