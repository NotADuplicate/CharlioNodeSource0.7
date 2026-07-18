// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Cleaver() constructor {
	sprite = spr_cleaver;
	damage = 35;
	ammoCost = 2;
	cooldown = 13; 
	duration = 4;
	name = "Cleaver"
	abilityName = "cleaver"
	text = "Fires a projectile which deals " + string(damage) + " damage and bleeds an enemy for " + string(duration) + " seconds. While bleeding, enemies take damage while walking proportional to how fast they are going.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			scr_ability_shoot(obj_cleaver)
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai,dir) {
		var bullet = instance_create(ai.x+lengthdir_x(16,dir), ai.y+lengthdir_y(16,dir), obj_cleaver);
		bullet.direction = dir;
		bullet.num = ai.num;
		ai.ammo -= ammoCost;
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && random(1) > 0.98) {
			if(collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,obj_bigBall,false,true) == noone) {
				dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y)
				aiUse(ai,dir);
				return(cooldown);
			}
		}
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}