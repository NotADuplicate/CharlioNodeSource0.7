// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackDamage() constructor {
	sprite = spr_attack;
	text = "Increase attack damage by 20%"
	maxStacks = 4;
	type = "Offense"
	
	static passiveGet = function(buffer) {
	}
	
	static passiveLose = function(buffer) {
	}
	
	static otherGet = function(num) {
		global.players[num].atk *= 1.2;
	}
	
	static otherLose = function(num) {
		global.players[num].atk /= 1.2;
	}
}