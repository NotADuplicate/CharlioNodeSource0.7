// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Decay() constructor {
	sprite = spr_decay;
	ammoCost = 3;
	cooldown = 30;
	name = "Decay"
	abilityName = "enrage"
	text = "Decay all enemies on your mouse for 10 seconds. While decayed, any healing they recieve is applied as damage"
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 150;
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < 150 && global.ammo > ammoCost) {
			instance_create(mouse_x,mouse_y,obj_decay);
			with(ball_other) {
				if(global.teamNum[num] != global.teamNum[ball_player.num] && point_distance(x,y,mouse_x,mouse_y) < 50) {
					node_send(ball_game.buffer,"eventName","Targeted Status","Target",num,"Status Num", 15, "User", ball_player.num);
				}
			}
			scr_ball_ammo(ammoCost)
			return(cooldown);
		}
	}
}