// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BodySlam() constructor {
	sprite = spr_blast;
	ammoCost = 2;
	cooldown = 50; 
	name = "Body Slam"
	abilityName = "bodySlam"
	text = "Jump straight up and down over 1 second, creating a shockwave where you land. The shockwave stuns nearby enemies for a duration depending on your current HP. (100 HP = 1 second of stun)";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"User",20,"Status Num",21)
			scr_ball_ammo(ammoCost);
			ball_player.bodySlam = true;
			return(cooldown);
		}
		else { return(0); }
	}
}