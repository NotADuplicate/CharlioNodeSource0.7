// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cleaver() constructor {
	sprite = spr_cleaver;
	damage = 40;
	bleedDamage = 90;
	ammoCost = 2;
	cooldown = 13; 
	duration = 4;
	name = "Cleaver"
	abilityName = "cleaver"
	text = "Fires a slow moving projectile which deals " + string(damage) + " damage and bleeds an enemy for " + string(duration) + " seconds. While bleeding, enemies take " + string(bleedDamage) + " damage per second while walking. The damage is not applied if they take knockback or teleport.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_cleaver)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}