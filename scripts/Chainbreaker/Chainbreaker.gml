// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Chainbreaker() constructor {
	sprite = spr_chain;
	damage = 175;
	ammoCost = 3;
	cooldown = 7; 
	duration = 3;
	name = "Chainbreaker"
	abilityName = "chainbreaker"
	text = "Chain yourself to any nearby enemy or ball. If they are still in range of the chain after 3 seconds of being chained, they take 175 damage and lots of knockback. Particularly good at pushing the ball.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 250;
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		if(scr_ball_dist(ball_player.x,ball_player.y,true) < 260 && global.ammo > ammoCost) {
			node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_chain,"eventName","Bullet")
			scr_ball_ammo(ammoCost)
			cool = 7;
		}
	}
}