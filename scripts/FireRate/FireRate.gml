// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FireRate() constructor {
	sprite = spr_fastfire
	text = "Increase primary weapon fire rate by 50%"
	maxStacks = 2;
	type = "Offense"
	
	static passiveGet = function(buffer) {
		global.shooting += .5;
	}
	
	static passiveLose = function(buffer) {
		global.shooting -= .5;
	}
	
	static otherGet = function(num) {
		global.players[num].fireRate+= 0.5
	}
	
	static otherLose = function(num) {
		global.players[num].fireRate-= 0.5
	}
}