// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Heal() constructor {
	sprite = spr_heal;
	healing = 120;
	ammoCost = 4;
	cooldown = 4; 
	name = "Health Shot"
	abilityName = "heal"
	text = "Shoots a slow moving projectile which goes through walls and heals any player " + string(healing) + " health."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_healthShot)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}