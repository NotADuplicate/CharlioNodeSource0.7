// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enrage() constructor {
	sprite = spr_anger;
	ammoCost = 4;
	cooldown = 50; 
	name = "Enrage"
	abilityName = "enrage"
	text = "Enrage a nearby player, giving them faster movement, attack speed, and ability cooldown. They also take increasing damage over time and heals to full on kill. Goes away after standing still for 3 seconds."
	tooltip = ["Enrage was found by John B. Enrage who died shortly after his discovery", "Enrage a bad player and they'll be enraged for the rest of their life.\nEnrage a good player and they'll be enraged for the rest of your life."];
	
	unlocked = false;
	
	stats = new AbilityStats();
	stats.damage = 1;
	stats.buffs = 4;
	stats.ammoSupply = -2;
	stats.add_synergy("damage", "CC", 0.5);
	stats.add_synergy("damage", "mobility", 0.5);
	stats.add_synergy("buffs", "healing", 0.75);
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 150;
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		if(scr_ball_dist(mouse_x,mouse_y,false) < 45 && point_distance(mouse_x,mouse_y,ball_player.x,ball_player.y) < 150 && global.ammo >= ammoCost) {
			instance_create(mouse_x,mouse_y,obj_anger);
			scr_ball_ammo(ammoCost)
			return(cooldown);
		}
	}
}