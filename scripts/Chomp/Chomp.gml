// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Chomp() constructor {
	sprite = spr_fangs;
	ammoCost = 2;
	cooldown = 15; 
	name = "Chomp"
	abilityName = "chomp"
	text = "A melee attack which deals damage equal to 50% of the user's missing health. Hitting an enemy heals the user to an amount equal to damage dealt."
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			dist = 60 * ball_player.scale
			dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y)
		    xp = ball_player.x + lengthdir_x(dist,dir);
		    yp = ball_player.y + lengthdir_y(dist,dir);
			node_send(buffer,"Dir",(ball_player.maxhp-ball_player.hp),"X",xp,"Y",yp,"Num",ball_player.num,"Obj",obj_chomp,"eventName","Bullet")
	        scr_ball_ammo(ammoCost);
			return(cooldown);
		}
		else { return(0); }
	}
}