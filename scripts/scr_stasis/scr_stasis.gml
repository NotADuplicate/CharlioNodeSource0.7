// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stasis(target){
	if(target == 100) { //stasis ball
		with(obj_bigBall) {
			stasis = true;
			sprite_index = spr_stasis;
			alarm[4] = 90;
			stasisx = hspeed;
			stasisy = vspeed;
			hspeed = 0;
			vspeed = 0;
		}
	}
	if(target == ball_player.num) { //stasis player
		ball_player.stasis = true;
		ball_player.sprite_index = spr_yellow;
		ball_player.alarm[8] = 90;
		ball_player.stasisx = ball_player.hspeed;
		ball_player.stasisy = ball_player.vspeed;
		ball_player.hspeed = 0;
		ball_player.vspeed = 0;
		global.invincibility = 90;
		global.stun = 90;
	}
	else if(target < 11){
		global.players[target].sprite_index = spr_yellow;
		global.players[target].alarm[2] = 90
	}
}