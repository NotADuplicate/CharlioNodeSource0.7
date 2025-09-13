// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Curse() constructor {
	sprite = spr_pentagram;
	damage = 50;
	maxDamage = 200;
	ammoCost = 2;
	cooldown = 14; 
	name = "Curse"
	abilityName = "curse"
	text = "Shoot a projectile which curses enemies. After you curse an enemy you begin charging the attack and can recast to deal 50-200 damage depending on how long you charged. Being moved resets the charge.";
	
	
	static abilityPressed = function(buffer) {
		if(ball_player.curseCharge > 0) {
			node_send(buffer,"eventName","Targeted Status","Target",ball_player.num,"User",ball_player.curseCharge,"Status Num",27)
			ball_player.curseCharge = 0
			return(cooldown);
		}
		else if(global.ammo > 1) {
			scr_ability_shoot(obj_curse);
		    scr_ball_ammo(ammoCost);
			return(cooldown);
		}
	}
}