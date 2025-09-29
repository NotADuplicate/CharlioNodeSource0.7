// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_targeted_status(status,target,user){
	switch(status) {
		case 1: //hook
			with(obj_hook) { 
				if(num == target) {
					hooked = global.players[user]
					alarm[0] = 60;
					if(ball_player.num = user) {
						alarm[4] = 1;
					}
				}
			}
		break;
		case 2: //heal 
			if(target == ball_player.num) {
				ball_player.hp += user;
				if(ball_player.hp > ball_player.maxhp && ball_player.overheal == false) 
					ball_player.hp = ball_player.maxhp
			}
		break;
		case 6: //enrage
			if(global.players[target].spellShield == 0 && global.players[target].enraged == false) {
				global.players[target].enraged = true;
				if(target > 10)
					global.players[target].num = user;
				if(target == ball_player.num) {
					with(ball_player) {
						enrageNum = user;
						enrageDmg = 0.4;
						global.shooting*= 2;
						global.coolReduc *= 2;
					}
					//start music
					audio_stop_sound(global.music);
					global.music = audio_play_sound(mus_shredIntro,0,false);
				}
			}
		break;
		case 7: //burn from burn passive
			if(target != ball_player.num)
				global.players[target].burn = user;
		break;
		case 8: //tp to marked player
			if(ball_player.num == target && global.mark) {
				global.mark = false;
				var marked = global.players[user]
				var dir = point_direction(ball_player.x,ball_player.y,marked.x,marked.y)
				ball_player.x = marked.x +lengthdir_x(60,dir)
				ball_player.y = marked.y +lengthdir_y(60,dir)
				with(ball_player) {
					while(place_meeting(x,y,ball_wall)) {
						x += lengthdir_x(5,other.dir)
						y += lengthdir_y(5,other.dir)
					}
				}
			}
		break;
		case 15:
			if(global.players[target].spellShield == 0){
				global.players[target].decay = 300;
				global.players[target].decayNum = user;
			}
		break;
		case 20: //airborne
			if(global.players[target].spellShield == 0) {
				throwSpd = user;
				if(ball_player.num == target) { //player gets thrown
					with(ball_player) {
						throwTime = other.throwSpd;
						global.slow = 0;
						upSpd = 9;
						grav = upSpd * 2/throwTime
						ball_game.alarm[7] = throwTime;
						global.stun = throwTime;
						speed = 0;
						global.invincibility = throwTime + 2;
						hspeed = (other.xp-x)/throwTime;
						vspeed = (other.yp-y)/throwTime;
					}
				}
				with(ball_other) { //others get thrown
					if(num == target) {
						throwTime = other.throwSpd;
						upSpd = 9;
						grav = upSpd * 2/throwTime
					}
				}
			}	
		break;
		case 21: //airborne w/o movement
			if(global.players[target].spellShield == 0) {
				throwSpd = user;
				if(ball_player.num == target) { //player gets thrown
					with(ball_player) {
						throwTime = other.throwSpd;
						global.slow = 0;
						upSpd = 9;
						grav = upSpd * 2/throwTime
						ball_game.alarm[7] = throwTime;
						global.stun = throwTime;
						speed = 0;
						global.invincibility = throwTime + 2;
						hspeed = 0;
						vspeed = 0;
					}
				}
				with(ball_other) { //others get thrown
					if(num == target) {
						throwTime = other.throwSpd;
						upSpd = 9;
						grav = upSpd * 2/throwTime
					}
				}
			}	
		break;
		case 26:
			global.players[target].tossGrabbed = 45;
			global.players[target].grabNum = user;
		break;
		case 22: //body slam
			if(global.players[target].spellShield == 0) {
				global.players[target].stunned = round(global.players[user].hp/3.3);
				if(target == ball_player.num) {
					global.stun = round(global.players[user].hp/4);
				}
			}
		break;
		case 23: //chain attaches
			with(obj_chain) { //target and user are flipped bc fucking spaghetti
				if(num == target) {
					if(user == 100) {
						ballLinked = true;
					}
					else
						chained[user] = global.players[user];
				}
			}
		break
		case 24: //chain gets broken
			with(obj_chain) { //target and user are flipped bc fucking spaghetti
				if(num == target) {
					if(user == 100) {
						ballLinked = false;
					}
					else
						chained[user] = 0;
				}
			}
		break;
		case 25: //get cursed
			reap = instance_create(0,0,obj_reaper);
			reap.num = target;
			reap.userNum = user;
			if(user == ball_player.num) {
				global.players[user].curseCharge = 1;
				global.players[user].curseX = ball_player.x;
				global.players[user].curseY = ball_player.y;
				ball_game.held = true;
				if(global.right == Abilities.curse)
					global.rightCool = 0;
				if(global.space == Abilities.curse)
					global.spaceCool = 0;
				if(global.Q == Abilities.curse)
					global.QCool = 0;
				if(global.R == Abilities.curse)
					global.RCool = 0;
			}
		break;
		case 27: //finish curse
			if(target == ball_player.num) {
				global.slow = 1;
			}
			with(obj_reaper) {
				if(userNum == target) {
					show_debug_message("Curse:")
					show_debug_message(user)
					dmg = 50+user;
					alarm[1] = 1;
				}
			}
		break;
		case 28: //finish curse with no damage
			if(target == ball_player.num) { //allow player to move again
				global.slow = 1;
			}
			with(obj_reaper) {
				if(userNum == target) {
					instance_destroy();
				}
			}
		break;
		case 29: //get marked
			if(user == ball_player.num) { //be the one who gets marked
				ball_player.marked = 15;
			}
			else if(target == ball_player.num) { //be the one who teleports
				ball_game.alarm[11] = 15;
			}
		break;
		case 30: //telekenesis
			if(user == ball_player.num) {
				ball_player.controlling = 180;
			}
			global.players[target].controlled = 300;
			global.players[target].controlledNum = user;
		break;
	}	
}