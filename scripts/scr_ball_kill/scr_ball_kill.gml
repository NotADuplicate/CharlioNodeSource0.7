// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ball_kill(deadNum,killer){
	if(deadNum > 0 && deadNum < 11) { //player deaths
		global.players[deadNum].hp = 250; //reset the dead players HP
		global.players[deadNum].garren = false;
		if(global.teamNum[deadNum] != global.teamNum[ball_player.num]) {//set respawn timer
			global.players[deadNum].respawnTimer = global.respawn2
		}
		else {
			global.players[deadNum].respawnTimer = global.respawn
		}
		if(killer == ball_player.num) { //killing while enraged
			if(ball_player.enraged == true)
				ball_player.hp = ball_player.maxhp;
			if(global.ammoThirst)
				global.ammo = global.maxAmmo;
		}
		ins = instance_create(900,50,kill_marker)
		ins.victim = deadNum;
		ins.killer = killer;
		with(global.players[deadNum]) {
			scr_cleanse(false);
		}
	}
	if(deadNum > 10 && deadNum < 20) { //destroy turret
		with(obj_turret) {
			if(num == deadNum) 
				instance_destroy()
		}
		if(instance_number(obj_turret) == 3) {
			with(jungle_wall) {
				if(jungleReset)
					instance_destroy()
			}
		}
	}
	if(deadNum > 20) {
		with(obj_monster) { //kill monster and give buff to the right player
			if(nameNum == deadNum) {
				num = killer;
				hp = -100;
				path_end()
				camp.image_alpha = .5;
				if(global.teamNum[killer] == global.teamNum[ball_player.num])
					camp.knownAlpha = .5;
				alarm[5] = 1;
				dead = true;
				if(killer == ball_player.num) { //stop being enraged
					if(ball_player.enraged == true) {
						ball_player.hp = ball_player.maxhp;
						ball_player.enrageDmg = 0.5
					}
					alarm[8] = 1;
					scr_ball_sound(snd_monsterBuff,ball_cam.x,ball_cam.y);
				}
				if(global.gameMode != "Royale" && nameNum == obj_drag.nameNum) { //dragon
					if(instance_exists(slayer_marker) == false || slayer_marker.victim != "Dragon") {
						obj_drag.dead = true;
						if(global.teamNum[killer] == global.teamNum[ball_player.num]) 
							global.xp += global.xpMax;
						else
							global.xp2 += global.xpMax2
						ins = instance_create(0,0,slayer_marker);
						ins.killer = killer
						ins.victim = "Dragon";
					}
				}
				else if(global.gameMode != "Royale" && nameNum == obj_garren.nameNum) { //garren
					if(instance_exists(slayer_marker) == false || slayer_marker.victim != "Garren Nashor") {
						ins = instance_create(0,0,slayer_marker);
						ins.killer = killer
						ins.victim = "Garren Nashor";
						i = 1;
						repeat(ball_game.loop) {
							if(global.teamNum[i] == global.teamNum[killer] && global.players[i].y > 10) {
								global.players[i].garren = true;
							}
							i++;
						}
					}
				}
				
			}
		}
	}
}