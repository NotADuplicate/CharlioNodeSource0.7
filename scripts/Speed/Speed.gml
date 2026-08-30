// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Speed() constructor {
	text = "Increase move speed by 15%"
	sprite = spr_speed;
	maxStacks = 2;
	type = "Mobility"
	
	stats = new AbilityStats();
	stats.ammoSupply = 1;
	
	static passiveGet = function(buffer) {
		ball_player.speedPassives += 0.15;
	}
	
	static passiveLose = function(buffer) {
		ball_player.speedPassives -= 0.15;
	}
	
	static otherGet = function(num) {
	}
	
	static otherLose = function(num) {
	}
}