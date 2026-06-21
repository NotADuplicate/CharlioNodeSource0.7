// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Airstrike() constructor {
	sprite = spr_airstrike;
	ammoCost = 4;
	cooldown = 15; 
	name = "Airstrike";
	abilityName = "chainbreaker"
	text = ""//Chain yourself to any nearby enemy or ball. If they are still in range of the chain after 3 seconds of being chained, they take " + string(damage) + " damage and lots of knockback. Particularly good at pushing the ball.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 0;
			instance_create(mouse_x,mouse_y,player_airstrike);
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		if(global.ammo >= ammoCost) {
			player_airstrike.alarm[0] = 1;
			scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else
			instance_destroy(player_airstrike)
	}
}