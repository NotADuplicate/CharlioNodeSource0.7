// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Size() constructor {
	sprite = spr_bigPills
	text = "+10% max hp and 10% size"
	maxStacks = 4
	type = "Defense"
	
	static passiveGet = function(buffer) {
	}
	
	static passiveLose = function(buffer) {
	}
	
	static otherGet = function(num) {
		global.players[num].maxhp = floor(global.players[num].maxhp*1.15)
		if(global.players[num].maxhp > 435)
			global.players[num].maxhp = 435
		global.players[num].image_xscale += .2;
		global.players[num].image_yscale += .175;
		global.players[num].scale += .2;
	}
	
	static otherLose = function(num) {
		global.players[num].maxhp = ceil(global.players[num].maxhp/1.15)
		if(global.players[num].maxhp < 250)
			global.players[num].maxhp = 250
		global.players[num].image_xscale -= .2;
		global.players[num].image_yscale -= .175;
		global.players[num].scale -= .2;
	}
}