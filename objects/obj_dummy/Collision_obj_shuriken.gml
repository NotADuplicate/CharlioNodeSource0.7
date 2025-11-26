/// @description Insert description here
// You can write your code in this editor
	scr_dummy_damage(50,other.num,false, spr_shuriken, false)
	instance_destroy(other);
		with(ball_game) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 49)
		}