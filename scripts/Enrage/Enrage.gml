// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enrage() constructor {
	sprite = spr_anger;
	ammoCost = 4;
	cooldown = 50; 
	name = "Enrage"
	abilityName = "enrage"
	text = "Use to enrage a nearby player including yourself. While enraged, the target moves 50% faster, shoots twice as fast, has half cool downs, but also takes increasing damage over time. Enrage goes away upon dying, going back to base, or standing still for 3 seconds.";
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 150;
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		if(scr_ball_dist(mouse_x,mouse_y,false) < 60 && global.ammo > ammoCost) {
			instance_create(mouse_x,mouse_y,obj_anger);
			scr_ball_ammo(ammoCost)
			return(cooldown);
		}
	}
}