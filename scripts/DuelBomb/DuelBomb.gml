// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DuelBomb() constructor {
	sprite = spr_duel;
	ammoCost = 2;
	cooldown = 42; 
	name = "Duel Bomb"
	abilityName = "duelBomb"
	text ="Throw a bomb which pulls any nearby players into the duel dimension. They remain there for 8 seconds or until there is only 1 team alive, then they teleport to their position before entering the duel dimension.";
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_duel, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}