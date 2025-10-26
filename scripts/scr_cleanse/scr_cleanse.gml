// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cleanse(){
	poison = 0;
	duel = 0;
	burn = 0;
	decay = 0;
	oil = 0;
	sleeping = 0;
	confuse = 0;
	chummed = 0;
	frost = 0;
	stasis = 0;
	inversion = 0;
	enraged = false;
	bleed = 0;
	marked = 0;
	murderball = 0;
	broken = 0;
	stunned = 0;
	glassShield = 0;
	magicBurn = 0;
	ghost = 0;
	with(obj_hook) {
		if(hooked == other) {
			instance_destroy();
		}
	}
	with(obj_gun) {
		if(num == other.num) {
			upgraded = 0;
			scale = 1;
			if(num == ball_player.num) {
				global.upgraded = false;
			}
		}
	}
}