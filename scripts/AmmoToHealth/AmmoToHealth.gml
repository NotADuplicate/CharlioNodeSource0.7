// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AmmoToHealth() constructor {
	text = "When dying, refund ammo into health"
	sprite = spr_manaSus;
	maxStacks = 1;
	type = "Defense"
	
	static passiveGet = function(buffer) {
		ball_player.livePass = true
	}
	
	static passiveLose = function(buffer) {
		ball_player.livePass = false
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}