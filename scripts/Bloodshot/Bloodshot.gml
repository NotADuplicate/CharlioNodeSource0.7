// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Bloodshot() constructor {
	sprite = spr_blood;
	damage = 110;
	selfDamage = 50;
	ammoCost = 1;
	cooldown = 4; 
	name = "Blood Shot"
	abilityName = "bloodshot"
	text = "Fire a projectile which deals " + string(damage) + " damage. Using this ability makes you take " + string(selfDamage) + " damage"
	
	stats = new AbilityStats();
	stats.damage = 5;
	stats.selfDamage = 2;
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_bloodShot);
	        scr_ball_ammo(ammoCost);
			scr_damage(selfDamage,ball_player.num,false, spr_blood, false)
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai,dir) {
		dir += random_range(-1,1) * ai.inaccuracy;
		node_send(ball_game.buffer,"eventName","Bullet","Num",ai.num,"X", ai.x, "Y", ai.y, "Obj", obj_bloodShot, "Dir", dir)
		ai.ammo -= ammoCost;
		with(ai) { scr_dummy_damage(50,num,false, spr_blood, false); }
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && ((random(1) > 0.98 && ai.hp > 100) || ai.invincibility > 0)) {
			if(collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,obj_bigBall,false,true) == noone) {
				dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y)
				aiUse(ai,dir);
				return(cooldown);
			}
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}