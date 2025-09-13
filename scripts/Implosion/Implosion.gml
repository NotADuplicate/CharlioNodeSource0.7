// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Implosion() constructor {
	sprite = spr_pushBomb;
	ammoCost = 2;
	cooldown = 12; 
	name = "Implosion Grenade"
	abilityName = "implosion"
	text = "Throw a bomb which pulls players towards it when it lands";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_startThrow(obj_imploder, sprite);
		}
	}
	
	static abilityReleased = function(buffer) {
		scr_endThrow(buffer);
		scr_ball_ammo(ammoCost);
		return(cooldown)
	}
}