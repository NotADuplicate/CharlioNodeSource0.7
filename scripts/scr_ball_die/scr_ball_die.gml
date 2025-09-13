// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_die(dmg,killer){
	with(ball_player) {
		while(livePass && global.ammo > 0 && ball_player.hp < 1) {
			global.ammo -= 1
			ball_player.hp += 5;
		}
		if(ball_player.hp < 1) {
			global.dead = true; //drop corpse
			ball_game.held = false;
			global.throwRange = 0;
			ball_player.moveSpd = global.baseMove
			ball_game.lore = scr_lore();
			ball_player.respawnTimer = global.respawn;
			view_set_visible(0,false)
			view_set_visible(1,true)
			if(killer > 10)
				killer = ball_player.num
			with(ball_game) {
				node_send(buffer,"eventName","Death","Target",ball_player.num,"Killer",killer)
				node_send(buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", ball_corpse, "Dir", 0)
			}
			with(inst_passive) {
				if(extraStacks > 0) {
					node_send(ball_game.buffer,"eventName","Passive Lost","Player Num",ball_player.num,"Passive Index", passiveIndex, "Count", extraStacks);
					show_debug_message("Got rid of extra stacks")
					show_debug_message(extraStacks)
				}
				extraStacks = 0;
				active = true;
			}
			x = -1000;
			y = -1000;
		}
	}
}