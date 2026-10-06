// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Deathtouch() constructor {
	sprite = spr_deathball;
	ammoCost = 4;
	cooldown = 15; 
	name = "Death Touch"
	abilityName = "deathTouch"
	text = "Shoots a projectile which applies death touch. Touching a death touched object kills you. Death touched balls do double tower damage."
	tooltip = ["Death touched balls deal double damage to towers\nAnd infinity times more damage to players"]
	
	stats = new AbilityStats();
	stats.damage = 0;
	stats.ammoSupply = -2;
	stats.add_synergy("damage","ballPush",1.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_deathTouch)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}