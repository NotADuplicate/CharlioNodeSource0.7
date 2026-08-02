// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BlastOff() constructor {
	sprite = spr_engine;
	damage = 80;
	ammoCost = 2;
	cooldown = 15; 
	duration = 8;
	name = "Blast Off"
	abilityName = "blastOff"
	text = "Create a short range rocket blast which sends you flying in the opposite direction. Hitting an enemy with the blast deals " + string(damage) + " damage and burns for 8 seconds.";
	
	stats = new AbilityStats();
	stats.damage = 2;
	stats.fire = 1;
	stats.mobility = 2;
	stats.ammoSupply = -1;
	stats.add_synergy("damage", "mobility", 1);
	stats.add_synergy("damageMultiplier","AP",0.2)
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			node_send(buffer,"Dir",point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y),"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_rocketBlast,"eventName","Bullet")
		    scr_ball_ammo(ammoCost);
			scr_player_move(point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)+180,20);
			return(cooldown);
		}
		else { return(0); }
	}
	
	static aiUse = function(ai, dir) {
		ai.ammo -= ammoCost;
		dir += random_range(-1,1) * ai.inaccuracy;
		node_send(ball_game.buffer,"eventName","Bullet","Num",ai.num,"X", ai.x, "Y", ai.y, "Obj", obj_rocketBlast, "Dir", dir)
		with(ai) {
			path_end();
			motion_add(dir+180, 30);
		}
	}
	
	static aiConsider = function(ai) {
		switch(ai.state) {
			case "Thirst":
				if(ai.burstMoving == 0 && point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) > 200 && collision_line(ai.enemy.x,ai.enemy.y,ai.x, ai.y, ball_wall, false, false) == noone) {
					dir = point_direction(ai.enemy.x, ai.enemy.y, ai.x, ai.y);
					aiUse(ai,dir);
					ai.burstMoving = 15;
					return(cooldown);
				}
				break;
			case "Flee":
				if(ai.burstMoving > 0 || point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) > 170) { return 0; }
				dir = point_direction(ai.enemy.x, ai.enemy.y, ai.x,ai.y);
				xp = ai.x + lengthdir_x(110, dir);
				yp = ai.y + lengthdir_y(110, dir);
				if(collision_line(ai.x,ai.y,xp,yp,ball_wall,false,false) == noone) { //if no walls behind them, blast off
					ai.burstMoving = 15;
					blastOffDir = dir-180;
					aiUse(ai,blastOffDir);
					return(cooldown);
				}
				break;
		}
		if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) < 60 && ai.enemyDistances[ai.mistakes*2] < 120) {
			dir = point_direction(ai.x,ai.y,ai.enemy.x, ai.enemy.y);
			aiUse(ai,dir);
			return(cooldown);
		}
		if(collision_point(ai.x,ai.y,obj_fire,false,false)) { //blast off away from fire
			if(ai.burstMoving > 0) { return 0; }
			blastOffDir = point_direction(ai.x,ai.y,obj_fire.x,obj_fire.y);
			aiUse(ai,blastOffDir);
			ai.burstMoving = 15;
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		if(ai.enemyDistances[0]-30 < ai.fightingDist - ai.enemyDistances[0]) { ai.fightingDist = 30; }
		return;
	}
}