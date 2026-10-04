// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BallPush() constructor {
	sprite = spr_kick
	text = "Move 50% faster while pushing the ball"
	name = "Dribbling"
	maxStacks = 1;
	type = "Mobility"
	
	static passiveGet = function(buffer) {
		ball_player.dribbling = true;
	}
	
	static passiveLose = function(buffer) {
		ball_player.dribbling = false;
	}
	
	static otherGet = function(num) {
		global.players[num].pushing = 1.1;
	}
	
	static otherLose = function(num) {
		global.players[num].pushing = 0.8;
	}
}