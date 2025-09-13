// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ArmorBreak() constructor {
	sprite = spr_spear;
	damage = 40;
	ammoCost = 2;
	cooldown = 16; 
	duration = 6;
	name = "Armor Break"
	abilityName = "armorBreak"
	text = "Shoot a slow moving spear which deals 40 damage and applies armor broken for 6 seconds. While armor broken, target takes double damage from all sources.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
			xp = ball_player.x+lengthdir_x(16,dir);
			yp = ball_player.y+lengthdir_y(16,dir);
			scr_ball_ammo(ammoCost)
			node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X",xp, "Y", yp, "Obj", obj_spear, "Dir", dir)
			return(cooldown);
		}
		else { return(0); }
	}
}