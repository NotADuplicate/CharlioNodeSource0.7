// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Axe() constructor {
	sprite = spr_fireaxe;
	damage = 50;
	ammoCost = 1;
	cooldown = 7; 
	critDamage = 170;
	name = "Fire Axe"
	abilityName = "fireAxe"
	text = "Swing a short range axe which deals 50 damage to enemies or 170 damage if they are burning";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_axetinguisher)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}