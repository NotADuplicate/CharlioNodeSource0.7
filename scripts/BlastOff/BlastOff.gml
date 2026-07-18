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
		show_debug_message("Creating blast off")
		show_debug_message(dir)
		ai.ammo -= ammoCost;
		var bo = instance_create_depth(ai.x,ai.y,ai.depth,obj_rocketBlast);
		bo.direction = dir;
		bo.image_angle = dir;
		bo.num = ai.num;
		with(ai) {
			path_end();
			motion_add(dir+180, 30);
		}
	}
	
	static aiConsider = function(ai) {
		switch(ai.state) {
			case "Thirst":
				if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) > 200 && collision_line(ai.enemy.x,ai.enemy.y,ai.x, ai.y, ball_wall, false, false) == noone) {
					dir = point_direction(ai.enemy.x, ai.enemy.y, ai.x, ai.y);
					aiUse(ai,dir);
					return(cooldown);
				}
				break;
			case "Flee":
				if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) > 170) { return 0; }
				dir = point_direction(ai.enemy.x, ai.enemy.y, ai.x,ai.y);
				xp = ai.x + lengthdir_x(110, dir);
				yp = ai.y + lengthdir_y(110, dir);
				if(collision_line(ai.x,ai.y,xp,yp,ball_wall,false,false) == noone) { //if no walls behind them, blast off
					show_debug_message("Blasting off towards player")
			
					blastOffDir = dir-180;
					aiUse(ai,blastOffDir);
					return(cooldown);
				}
				break;
		}
		if(point_distance(ai.x,ai.y,ai.enemy.x,ai.enemy.y) < 60 && ai.enemyDistances[6] < 140) {
			dir = point_direction(ai.x,ai.y,ai.enemy.x, ai.enemy.y);
			aiUse(ai,dir);
			return(cooldown);
		}
		if(collision_point(ai.x,ai.y,obj_fire,false,false)) { //blast off away from fire
			show_debug_message("Blasting off away from fire")
			blastOffDir = point_direction(ai.x,ai.y,obj_fire.x,obj_fire.y);
			aiUse(ai,blastOffDir);
			return(cooldown);
		}
		return 0;
	}
	
	static aiDecisions = function(ai) {
		if(ai.hp > 110) { ai.fightingDist = 30; }
		return;
	}
}