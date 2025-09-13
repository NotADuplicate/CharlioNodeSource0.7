// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Upgrade() constructor {
	sprite = spr_pistol;
	ammoCost = 1;
	cooldown = 20; 
	duration = 7;
	name = "Upgrade"
	abilityName = "upgrade"
	text = "Upgrades your gun for 7 seconds. During this time you cannot use abilities."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
	        scr_ball_ammo(ammoCost);
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 54)
			return(cooldown);	
		} 
		else { return(0); }
	}
}