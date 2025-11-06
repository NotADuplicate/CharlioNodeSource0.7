// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Kick() constructor {
	sprite = spr_kick;
	ammoCost = 1;
	cooldown = 11; 
	name = "Dribble"
	abilityName = "dribble"
	text = "Apply force to yourself, nearby players, and the ball towards your mouse. If used on the ball the cooldown is only 3 seconds unless you exit range of the ball.";
	
	
	static abilityPressed = function(buffer) {
		if(global.ammo >= ammoCost) {
			ball_game.held = true;
			ball_game.range = 190;
			return(0)
		}
		else { return(0); }
	}
	
	static abilityReleased = function(buffer) {
		var dir = point_direction(ball_player.x,ball_player.y, mouse_x, mouse_y);
		
		scr_player_move(dir, 13);
		node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 59);
		node_send(buffer,"Dir",dir,"X",ball_player.x,"Y",ball_player.y,"Num",ball_player.num,"Obj",obj_kick,"eventName","Bullet")
		scr_ball_ammo(ammoCost)
		
		if(point_distance(ball_player.x,ball_player.y, obj_bigBall.x, obj_bigBall.y) < 190) {
			scr_ball_move(dir, 12, ball_player.num);
			ball_player.kickedBall = true;
			return(3);
		}
		ball_player.kickedBall = false;
		return(cooldown);
	}
}