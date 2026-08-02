// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Shuriken() constructor {
	sprite = spr_shuriken;
	damage = 55;
	ammoCost = 2;
	cooldown = 10; 
	name = "Shuriken"
	abilityName = "shuriken"
	text = "Shoot a shuriken which deals " + string(damage) + " damage. If you hit you refund the ammo and reset the cooldown to 1 second.";
	
	stats = new AbilityStats();
	stats.damage = 3;
	stats.ammoSupply = 0;
	stats.add_synergy("damage", "CC", 0.5);
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_shuriken,"eventName","Bullet")
		    scr_ball_ammo(ammoCost);
			return(cooldown)
		}
		else { return(0) }
	}
	
	static aiUse = function(ai,dir) {
		dir += random_range(-1,1) * ai.inaccuracy;
		var bullet = instance_create(ai.x+lengthdir_x(16,dir), ai.y+lengthdir_y(16,dir), obj_shuriken);
		bullet.direction = dir;
		bullet.num = ai.num;
		ai.ammo -= ammoCost;
	}
	
	//calls every tick to decide if to use or not
	static aiConsider = function(ai) {
		if(ai.state == "Skirmish" && ai.enemyDistances[ai.mistakes*2] < random_range(-2000,600)) {
			if(collision_line(ai.x,ai.y,ai.enemy.x,ai.enemy.y,obj_bigBall,false,true) == noone) {
				dir = point_direction(ai.x,ai.y,ai.enemy.x,ai.enemy.y)
				aiUse(ai,dir);
				return(cooldown);
			}
		}
		if(ai.state == "Fight Monster") {
			dir = point_direction(ai.x,ai.y,ai.monster.x,ai.monster.y)
			aiUse(ai,dir);
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		return;
	}
}