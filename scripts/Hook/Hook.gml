// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Hook() constructor {
	sprite = spr_hook;
	ammoCost = 2;
	cooldown = 16; 
	name = "Hook"
	abilityName = "hook"
	text = "Launches a hook which pulls players and the ball towards you. Enemy players are stunned while being hooked. Pulls you towards a wall if it hits one. Release the button to stop hooking";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ball_ammo(2);
			scr_ability_shoot(obj_hook);
			ball_game.held = true;
			return(cooldown);
		}
		else { return(0) }
	}
	
	static abilityReleased = function(buffer) {
		if(instance_exists(obj_hook) && obj_hook.hooked != 0) {
			node_send(buffer,"eventName","Hook Stop","Obj",obj_hook,"Num",ball_player.num)
		}
		return(cooldown);
	}
}