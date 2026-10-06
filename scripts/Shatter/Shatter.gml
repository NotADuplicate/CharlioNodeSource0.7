// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Shatter() constructor {
	sprite = spr_shatter;
	damage = 75;
	ammoCost = 1;
	cooldown = 18;
	knockback = 4
	name = "Shatter"
	abilityName = "shatter"
	text = "Fire a fast moving projectile which explodes upon contact with the ball or a wall. Radius is doubled if it hit the ball. Explosions deal " + string(damage) + " to nearby enemies."
	tooltip = ["Shatter has much larger explosion when it hits the ball", "Shatter will go right through players\nIt only explodes on a wall or the ball"]
	
	stats = new AbilityStats();
	stats.damage = 3;
	stats.ammoSupply = 0;
	stats.add_synergy("damage", "ballPush", 0.5);
	stats.ballPressure = 4;
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_shatter);
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}