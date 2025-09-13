// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MaxAmmo() constructor {
	text = "Increase max ammo by 4"
	sprite = spr_ammo;
	maxStacks = 3;
	type = "Resources"
	
	static passiveGet = function(buffer) {
		global.maxAmmo += 4
	}
	
	static passiveLose = function(buffer) {
		global.maxAmmo -= 4
	}
	
	static otherGet = function(num) {
		global.players[num].maxAmmo += 4;
	}
	
	static otherLose = function(num) {
		global.players[num].maxAmmo -= 4;
	}
}