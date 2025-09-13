// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GlassShield() constructor {
	sprite = spr_glass_defense;
	ammoCost = 3;
	cooldown = 16; 
	name = "Glass Shield"
	abilityName = "glassShield"
	text = "Apply a shield to any player that makes them invincible for 1.5 seconds then breaks and then they take double damage for the next 6 seconds.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			dist = point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y);
			target = ball_player.num;
			with(ball_other) {
				if(other.dist > point_distance(x,y,mouse_x,mouse_y)) {
					other.dist = point_distance(x,y,mouse_x,mouse_y);
					other.target = num;
				}
			}
			scr_ball_ammo(ammoCost)
			node_send(buffer,"eventName","Status","Target",target,"Status Num", 55);
			return(cooldown);
		}
		else { return(0); }
	}
}