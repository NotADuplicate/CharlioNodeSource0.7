// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Revive() constructor {
	sprite = spr_heart;
	ammoCost = 5;
	cooldown = 40;
	duration = 1;
	name = "Revive"
	abilityName = "revive"
	text = "Chain yourself to a nearby ally soul. If you are still attached in " + string(duration) + " seconds, they are revived.";
	
	
	static abilityPressed = function(buffer) { 
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 200;
			
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		//Check for valid targets
		active = false;
		with(ball_corpse) {
			if(point_distance(x,y,ball_player.x,ball_player.y) < 200 && global.teamNum[num] == global.teamNum[ball_player.num]) {
				other.active = true;
			}
		}
		if(active && global.ammo > ammoCost) {
			node_send(buffer,"Dir",0,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_revive,"eventName","Bullet")
			scr_ball_ammo(ammoCost)
			return(cooldown);
		}
		return(0);
	}
}