// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_status(status,target){
	switch(status) {
		case 1: //stasis
			if(global.players[target].spellShield == 0)
				scr_stasis(target);
		break;
		case 2: //invis
				global.players[target].vis = false
				global.players[target].alarm[1] = 120;
				global.players[target].vis = false;
				global.players[target].alarm[1] = 120;
		break;
		case 3: //bleed
			if(global.players[target].spellShield == 0)
				global.players[target].bleed = 30*Abilities.cleaver.duration;
		break;
		case 4: //invisible passive
			global.players[target].invPass = true;
		break;
		case 5: //death Touch
			if(global.players[target].spellShield == 0) {
				if(target == 100) {
					obj_bigBall.sprite_index = spr_deathball;
					obj_bigBall.alarm[5] = 15;
				}
				else {
					global.players[target].murderball = 150;
				}
			}
		break;
		case 6: //enrage
			if(global.players[target].spellShield == 0 && global.players[target].enraged == false) {
				global.players[target].enraged = true;
				if(target == ball_player.num) {
					with(ball_player) {
						global.shooting*= 2;
						global.coolReduc *= 2;
					}
				}
			}
		break;
		case 7: //stop being enraged
			if(global.players[target].enraged) {
				global.players[target].enraged = false;
				if(target == ball_player.num) {
					global.shooting = global.shooting/2;
					global.coolReduc = global.coolReduc/2;
				}
			}
		break;
		case 8: //block
			global.players[target].blocking = 30;
			if(target == ball_player.num)
				global.invincibility = 30;
		break;
		case 9: //passive shooting for bolt
			global.players[target].fireRate+= 0.5
		break;
		case 10: //passive ramming
			global.players[target].ramming = true;
		break;
		case 11: //increase dmg
			global.players[target].atk *= 1.2;
		break
		case 12: 
			if(global.players[target].spellShield == 0)
				global.players[target].poison = 360;
		break;
		case 13: 
			if(global.players[target].spellShield == 0 && global.players[target].poison < 100)
				global.players[target].poison += 3;
		break;
		case 14:
			if(target == 100) {
				obj_bigBall.spellShield = 240;
			}
			else
				global.players[target].spellShield = 240;
		break;
		case 15:
			if(global.players[target].spellShield == 0)
				global.players[target].decay = 300;
		break;
		case 16:
			if(global.players[target].spellShield == 0) {
				global.players[target].broken = 180;
			}
		break;
		case 17: //Frost
			global.players[target].burn = 0;
			if(global.players[target].spellShield == 0) {
				scr_ball_sound(snd_frost,global.players[target].x,global.players[target].y);
				global.players[target].frost = 30*Abilities.frost.duration;
				if(target == 100) { //slow ball
					obj_bigBall.speed = round(obj_bigBall.speed/2)
				}
			}
		break;
		case 18: //fire
			global.players[target].frost = 0;
			if(global.players[target].spellShield == 0)
				global.players[target].burn = 250;
		break;
		case 19: //oil
			if(global.players[target].spellShield == 0)
				global.players[target].oil = 240;
		break;
		case 20: //cryo
			if(global.players[target].spellShield == 0) {
				global.players[target].cryo = 150;
				global.players[target].frost = 150;
				if(target = ball_player.num)
					global.stun = 150;
			}
		break;
		case 21: //send walls passive
			global.players[target].wallPassive = true;
		break;
		case 22: //shield bash
			if(global.players[target].spellShield == 0) {
				global.players[target].stunned = 90;
				if(target == ball_player.num) {
					global.stun = 90;
					//global.slow = .75;
					//ball_game.alarm[7] = 90;
				}
			}
		break;
		case 23: //ability power
			global.players[target].magic *= 1.2;
		break;
		case 24: //sleep
			if(global.players[target].spellShield == 0) {
				global.players[target].drowsy = 80;
			}
		break;
		case 25: //unsleep due to dmg
			global.players[target].sleeping = 0;
			if(target == ball_player.num) {
				ball_player.napping = false;
			}
		break;
		case 26: //unget damage passive
			global.players[target].atk *= 1/1.2;
		break;
		case 27:
			global.players[target].magic *= 1/1.2;
		break;
		case 28:
			global.players[target].healing = 1.5;
		break;
		case 29:
			global.players[target].sponge = true;
			if(global.players[target].sameTeam && target != ball_player.num) {
				global.sponge = global.players[target]
				if(instance_exists(passive_sponge))
					instance_destroy(passive_sponge)
			}
		break;
		case 30:
			global.players[target].firePassive = true;
		break
		case 31: //see loadout
			//if(global.teamNum[target] != global.teamNum[ball_player]) {
				i = 0
				repeat(global.loadoutSize[target]+1) {
					global.knownLoadout[target,i] = global.loadout[target,i]
					i++;
				}
			//}
		break;
		case 32: //milknum
			with(global.players[target]) {
				scr_cleanse();
			}
		break;
		case 33:
			global.players[target].sponge = false;
			if(global.players[target].sameTeam && target != ball_player.num) {
				global.sponge = 0;
			}
		break;
		case 34: //confuse
			global.players[target].confuse = 75;
		break;
		case 35:
			global.players[target].chummed = 450;
		break;
		case 36:

		break;
		case 37:
			global.players[target].quickTap = 10;
			with(obj_grenade) {
				if(num == target)
					alarm[0] = 1;
			}
			with(other_bolt) {
				if(num == target)
					charge = 150;
			}
			with(player_bolt) {
				if(num == target)
					charge = 150;
			}
		break;
		case 38: //shield
			global.players[target].shield = 240;
			if(target == ball_player.num) {
				global.defense *= 2;
				global.resistance *= 2;
			}
		break;
		case 39: //spellBlade
		if(global.players[target].alarm[6] > 0) {
		}
		else {
			global.players[target].atk *= 1.5;
		}
			global.players[target].alarm[6] = 45;
		break;
		case 40: //magic shield
			global.players[target].magicShield = 240;
			if(target == ball_player.num)
				global.resistance *= 2;
		break;
		case 41: //mark
			global.players[target].marked = 90;
		break;
		case 42: //life steal
			global.players[target].lifeSteal += .15;
		break;
		case 43:
			global.players[target].ghosting = 90;
		break;
		case 44: //inverted
		if(global.players[target].spellShield == 0) {
			if(target == 100)
				obj_bigBall.inversion = 120;
			else
				global.players[target].inversion = 180;
		}
		break;
		case 45://insta sleep
			if(global.players[target].spellShield == 0) {
				global.players[target].drowsy = 1;
			}
		break;
		case 46: //jam
			if(global.players[target].spellShield == 0) {
				global.players[target].jam = 45;
			}
		break;
		case 47: //drone control
			if(obj_bigBall.spellShield == 0 && obj_bigBall.drone == 0) {
				obj_bigBall.drone = target;
				obj_bigBall.alarm[9] = 20;
			}
		break;
		case 48:
			obj_bigBall.drone = 0;
			obj_bigBall.droneAmmo = 0;
		break;
		case 49: //refund shuriken
			if(target == ball_player.num) {
				global.ammo += 2;
				if(global.ammo > global.maxAmmo)
					global.ammo = global.maxAmmo;
				if(global.right == Abilities.shuriken)
					global.rightCool = 0.5;
				if(global.space == Abilities.shuriken)
					global.spaceCool = 0.5;
				if(global.Q == Abilities.shuriken)
					global.QCool = 0.5;
				if(global.R == Abilities.shuriken)
					global.RCool = 0.5;
			}
		break;
		case 50: //dashing
			global.players[target].dashing = 10;
			scr_ball_sound(snd_dash,global.players[target].x,global.players[target].y);
		break;
		case 51: //destroy corpse with no XP
			with(ball_corpse) {
				if(num = target) {
					instance_destroy()
				}
			}
		break;
		case 52: //destroy corpse with XP
			with(ball_corpse) {
				if(num = target) {
					instance_destroy()
					if(global.teamNum[num] != global.teamNum[ball_player.num]) {// give xp for the kill
						var xpPercent = max(20 + 5*(global.totalLevels2-global.totalLevels),5);
						global.xp += global.xpMax*xpPercent/100;
					}
					else {
						var xpPercent = max(20 + 5*(global.totalLevels-global.totalLevels2),5);
						global.xp2 += global.xpMax2*xpPercent/100;
					}
				}
			}
		break;
		case 53: //get plasma'ed
			if(global.players[target].spellShield == 0)
				global.players[target].magicBurn = 45;
		break;
		case 54: //get gun upgraded
			with(obj_gun) {
				if(num == target) {
					upgraded = 300;
				}
			}
			if(target == ball_player.num) {
				global.upgraded = true;
				with(ball_game) {
					reload = 30;
					if(revving > 0) revving = 30;
				}
			}
		break;
		case 55: //glass shield
			if(global.players[target].spellShield == 0) {
				global.players[target].glassShield = 45;
				if(target == ball_player.num)
					global.invincibility = 45;
			}
		break;
		case 56:
			global.players[target].firePassive = false;
		break
	}	
}