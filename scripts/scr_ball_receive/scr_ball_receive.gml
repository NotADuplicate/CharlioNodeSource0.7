function scr_ball_receive() {
	var buffer = argument[0];
	var message_id = buffer[? "eventName"]
	if(instance_exists(ball_player) || message_id = "Start Game" || message_id == "Team Name") {//global.playBall || message_id < 3 || message_id == 14) {
	switch(message_id) {
	    case 0:
	        global.game = buffer_read(buffer,buffer_string);
	    case 1: 
	        xp = buffer_read(buffer, buffer_u16);
	        yp = buffer_read(buffer, buffer_u16);
	        instance_create(xp,yp,obj_click);
	    break;
		case "Ping":
			num = buffer[? "Num"];
			global.ping[num] = buffer[? "Ping"]
			if(num == obj_client.index) {
				obj_client.ping = current_time - buffer[? "clientTime"]
				estimatedServerTime = buffer[? "serverTime"] + obj_client.ping/2
				global.pingOffset = buffer[? "serverTime"] - current_time;
			}
		break;
		case "Tower Target":
			towerNum = buffer[? "Num"];
			target = buffer[? "Target"];
			scr_tower_target(towerNum, target);
		break;
	    case "Start Game": //start game
	        global.ammo = 0;
			global.playBall = false;
	        global.ready = 0;
	        obj_client.ready = false;
			global.mons = 21;
			i = 0;
			repeat(10) {
				global.players[i] = self;
				global.ping[i] = 0;
				i++;
			}
	            if(instance_exists(inst_game)) { //delete the old game object to make way for the new
	                instance_destroy(inst_game);
	            }
			global.gameMode = buffer[? "GameMode"]
						show_debug_message("\n /n")
			show_debug_message(global.gameMode)
			ins = instance_create_depth(0,0,0,ball_game);
			
			room_goto(demo_room);
			
	        ins.alarm[3] = 1;
	        ins.loop = int64(buffer[? "Players"])
	        obj_client.index = int64(buffer[? "Num"])
			if(obj_client.index > ins.loop) {
				
				show_message("This is crashing the game with some extra information. Please relay the following message to Charlie!")
				show_message("Players: " + string(ins.loop) + " \nNum: " + string(obj_client.index))
				popsfk = phgfbnjds;
			}
			

	        random_set_seed(buffer[? "Random"]);
	        global.ammodrop = 50/30//(buffer_read(buffer,buffer_u8)/30);
	        //global.ultdrop = buffer_read(buffer,buffer_u8)
			global.abilityNum = 1//buffer_read(buffer,buffer_u8)/100;
			global.leveled = buffer[? "Levels"]
			global.simple = buffer[? "Simple"]
			global.cSwitch = true//buffer_read(buffer,buffer_bool);
	        global.teaming = true//buffer_read(buffer,buffer_bool);
			if(buffer[? "Active"]) {
				instance_create(0,0,obj_music);
				ball_game.startingSound = true;
				ball_game.startTimer = 0.1
			}
			
	    break;
	    case "Players Update"://player positions 
	        nums = buffer[? "nums"]
	        xps = buffer[? "Xs"]
	        yps = buffer[? "Ys"]
			gunDirs = buffer[? "dirs"]
			healths = buffer[? "healths"]
			scr_playerUpdate(nums,xps,yps,healths,gunDirs)
	    break;
	    case 9:
	        readying = buffer_read(buffer,buffer_bool);
	        if(readying == true) 
	            global.ready++;
	        else
	            global.ready--;
	    break;
	    case "Death":
			show_debug_message("Death received")
	        dead = buffer[? "Target"]
			killer = buffer[? "Killer"]
			icon = buffer[? "Icon"]
			show_debug_message(icon)
	        scr_ball_kill(dead,killer,icon)
	    break;
	    case "Hook Stop": //stop using something
			ob = buffer[? "Obj"]
			num2 = buffer[? "Num"]
			//game_end()
			scr_hook_stop(ob,num2)
	    break;
		case "Monster Hp": 
			monsNum = buffer[? "Num"]
			monsHp = buffer[? "Hp"]
			with(obj_monster) {
				if(nameNum == other.monsNum) {
					if(hp > 0) {
						hp = other.monsHp;
					}
				}
			}
		break;
	    case "Bullet": 
	        xp = buffer[? "X"]
	        yp = buffer[? "Y"]
	        dir = buffer[? "Dir"]
	        ob = buffer[? "Obj"]
			primary = buffer[? "Primary"];

	        bullet = instance_create(xp,yp,ob);
			var num = buffer[? "Num"];
			
			if(primary) {
				with(obj_gun) {
					if(self.num == num) {
						event_user(0);
					}
				}
			}
			
	        bullet.num = num;
	        if(ob == obj_grenade || ob == upgraded_grenade)
	            bullet.alarm[0] = buffer[? "Timer"]+1;
	        bullet.direction = dir;
			if(dir > 360)
				bullet.curving = -1;
	        bullet.image_angle = dir;
	    break;
	    case "Basic Attack": //bullet
	        xp = buffer[? "X"]
	        yp = buffer[? "Y"]
	        dir = buffer[? "Dir"]
	        ob = buffer[? "Obj"]
	        bullet = instance_create(xp,yp,ob);
	        bullet.num = buffer[? "Num"]
	        if(ob == obj_grenade || ob == upgraded_grenade)
	            bullet.alarm[0] = buffer[? "Timer"]+1;
	        bullet.direction = dir;
			if(dir > 360)
				bullet.curving = -1;
	        bullet.image_angle = dir;
	    break;
	    case "Bolt dir": //bolt aim
	        num3 = buffer[? "Num"]
	        scr_bolt(num3,buffer[? "Dir"])
	    break;
	    case "Ball Move": //move the ball
			num4 = buffer[? "Num"]
			global.lastTouch = num4
			if(true) { //num != obj_client.index) {
		        xspd = buffer[? "hspeed"]
		        yspd = buffer[? "vspeed"]
				if(obj_bigBall.stasis) {
					obj_bigBall.stasisx = xspd
					obj_bigBall.stasisy = yspd
				} 
				else {
					obj_bigBall.xspd = xspd;
					obj_bigBall.yspd = yspd;
				}
			}
	    break;
	    case "Status": //send status
	        num5 = buffer[? "Target"]
			stat= buffer[? "Status Num"]
	        scr_status(stat,num5);
	    break;
	    case 12:
	        num6 = buffer_read(buffer,buffer_u8);
			scr_jug(num6);
	        //global.players[num].jug = true;
	    break;
	    case "Bolt":
	        num7 = buffer[? "Num"]
			upgraded = buffer[? "Upgraded"]
			if(upgraded) {
				ins = instance_create(500,500,upgraded_bolt);
			} else {
				ins = instance_create(500,500,other_bolt);
			}
	        ins.num = num7;
	        ins.fire = buffer[? "Shooting"]
	    break;
		case "Game Over":
			global.ballGameOver = buffer[? "Winner"]
			var towerDamages = buffer[? "towerDamages"]
			var ballPushes = buffer[? "playersBallPush"]
			var healingDealt = buffer[? "healingDealt"]
			var mvpNum = buffer[? "mvpId"]
			show_debug_message(towerDamages[| 0])
			show_debug_message(ballPushes[| 0])
			show_debug_message(mvpNum)
			//Set up all the loadout UI objects
			leftLoadoutY = 105;
			rightLoadoutY = 105;
			for (var i = 0; i < instance_number(obj_loadout); i++){
			    var inst = instance_find(obj_loadout, i);
				var num = inst.num;
				show_debug_message("Loadout num:")
				show_debug_message(num)
				global.players[num].towerDamage = towerDamages[| num-1];
				global.players[num].ballPush = ballPushes[| num-1];
				global.players[num].healingDealt = healingDealt[| num-1];
				if(num == mvpNum) {
					inst.mvp = true;
				}
				
				if(global.teamNum[num] == -1) { //left side
					inst.y = leftLoadoutY
					leftLoadoutY += 190;
				}
				else if(global.teamNum[num] == 1) { //right side
					inst.y = rightLoadoutY
					rightLoadoutY += 190;
				}
			}
			instance_create(250,720,obj_lobbyButton);
			instance_create(700, 720, obj_replayButton);
		break;
	    case "Team Name": //recieve names
			show_debug_message("Names")
	        num8 = buffer[? "Num"]
	        global.names[num8] = buffer[? "Name"]
			if(global.teaming != 0) {
				show_debug_message(num8)
				global.teamNum[num8] = buffer[? "Team"]
				show_debug_message(buffer[? "Team"])
			}
	    break;
		case "Throw Sprite":
			gunNum = buffer[? "Num"]
			spr = buffer[? "Sprite"]
			for (var i = 0; i < instance_number(obj_gun); i++){
			    var gun = instance_find(obj_gun, i);
				if(gun.num == gunNum) {
					if(spr == -1) {
						gun.throwing = false;
					} else {
						gun.throwing = true;
						gun.throwSprite = spr
					}
				}
			}
		break;
	    case 15: //who wins a game
			
	    break;
	    case 16:
	        index = buffer_read(buffer,buffer_u8);
	        global.deaths[index] = buffer_read(buffer,buffer_u8);
	        global.kills[index] = buffer_read(buffer,buffer_u8);
	        global.wins[index] = buffer_read(buffer,buffer_u8);
	    break;
	    case 17: //who wins a game
	        var teamwin = buffer_read(buffer,buffer_u8);
	        ins = instance_create(0,0,gui_win);
	        ins.teamwin = teamwin;
			ins.num = -1;
	    break;
		case 23:
			num9 = buffer_read(buffer,buffer_u8);
			if(num9 == obj_client.index) {
				obj_client.alarm[9] = 1;
				room_goto(0);
			}
		break;
		case "Player Health": //recieve hp
			num10 = buffer[? "Num"]
			hpVal = buffer[? "Hp"]
			if(num10 != ball_player.num)
				global.players[num10].hp = hpVal
		break;
		case "Ball Pos":
		//if(obj_client.ping < current_time - global.lastTouchTime) {
			xp = buffer[? "X"]
			yp = buffer[? "Y"]
			xspd = buffer[? "Xspd"]
			yspd = buffer[? "Yspd"]
			serverTime = buffer[? "Time"]
			local_ball.x = xp;
			local_ball.y = yp;
			local_ball.xspd = xspd;
			local_ball.yspd = yspd;
			var dist = point_distance(ball_player.x,ball_player.y,local_ball.x,local_ball.y);
			if(dist > 800 || !obj_bigBall.started) {
				obj_bigBall.x = xp;
				obj_bigBall.y = yp;
				obj_bigBall.xspd = xspd;
				obj_bigBall.yspd = yspd;
				return;
			}
				timeAgo = current_time - serverTime + global.pingOffset;
				var predictionTime = -20;
				var dt_scale = 30 * delta_time / 1000000;
				while(predictionTime < timeAgo && global.predict && abs(local_ball.xspd) + abs(local_ball.yspd) > 0.5) {
					var lastX = local_ball.x;
					with(local_ball) {
						scr_ballStep(dt_scale);
					}
					predictionTime += 33;
				}
				//extraPredictedX = local_ball.x + obj_bigBall.xspd * (obj_client.ping/33);
				//extraPredictedY = local_ball.y + obj_bigBall.yspd * (obj_client.ping/33);
				//if(obj_client.ping+20 < (current_time - global.lastTouchTime)/2) {// || (abs(obj_bigBall.x-local_ball.x) + abs(obj_bigBall.y-local_ball.y))/2 > (abs(obj_bigBall.xspd) + abs(obj_bigBall.yspd)) * ((10+obj_client.ping)/33)) {
					//if(scr_distFromHistory(local_ball.x, local_ball.y) < 30) { return; }
					//show_debug_message("dist from hist")
					//show_debug_message(scr_distFromHistory(local_ball.x, local_ball.y))
			snapDist = 3
			if(abs(obj_bigBall.x-local_ball.x) < snapDist)
				obj_bigBall.x = local_ball.x;
					
			if(abs(obj_bigBall.y-local_ball.y) < snapDist)
				obj_bigBall.y = local_ball.y;
					
			localWeight = max(50 - scr_distFromHistory(local_ball.x, local_ball.y),0.5);//max((abs(obj_bigBall.xspd) + abs(obj_bigBall.yspd)+10) - abs(obj_bigBall.y-local_ball.y) - abs(obj_bigBall.x-local_ball.x),0);
			obj_bigBall.x = (obj_bigBall.x*localWeight + local_ball.x)/(localWeight+1);
			obj_bigBall.y = (obj_bigBall.y*localWeight + local_ball.y)/(localWeight+1);
			obj_bigBall.xspd = (obj_bigBall.xspd*localWeight + local_ball.xspd)/(localWeight+1);
			obj_bigBall.yspd = (obj_bigBall.yspd*localWeight + local_ball.yspd)/(localWeight+1);
				//}
		break;
		case "Tower Damage":
			towerNum = buffer[? "Num"]
			towerDmg = buffer[? "Damage"]
			scr_tower_dmg(towerNum,towerDmg);
		break;
		case "Targeted Status":
	        num11 = buffer[? "Target"]
			user = buffer[? "User"]
			stat= buffer[? "Status Num"]
			scr_targeted_status(stat,num11,user);
		break;
		case "Ammo": // FIX LATER, IMPLEMENT REAL AMMO
			num12 = buffer[? "Num"]
			if(num12 < global.loop) {
				global.players[num12].ammo = buffer[? "Ammo"]
				if(global.players[num12].ammo > global.players[num12].maxAmmo)
					global.players[num12].maxAmmo = global.players[num12].ammo
			}
		break;
		case "Open Gates":
			instance_create(0,0,obj_music);
			ball_game.startingSound = true;
		break;
		case "Swap":
			num = buffer[? "Num"]
			if(num == ball_player.num) {
				ball_player.x = buffer[? "X"]
				ball_player.y = buffer[? "Y"]
			}
		break;
		case "Thrown": //get thrown by toss grab 
			num = buffer[? "Num"]
			xp = buffer[? "X"]
			yp = buffer[? "Y"]
			throwSpd = 20;
			if(ball_player.tossGrabbed > 0) { //player gets thrown
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
				if(tossGrabbed > 0) {
					throwTime = other.throwSpd;
					upSpd = 9;
					grav = upSpd * 2/throwTime
				}
			}
		break;
		case "Loadout": //recieve loadouts
			num = buffer[? "Num"]
			index2 = buffer[? "Slot"]
			abilityIndex = buffer[? "Ability"]
			if(index2= 0) { //boots
				passiveSprite = buffer[? "PassiveSprite"]
			}
			if(index2 > 4) { //passives
				passiveIndex = buffer[? "PassiveIndex"]
				passiveOb = Passives.list[passiveIndex];
			} 
			if(abilityIndex > array_length(Abilities.list)) {
				show_debug_message("Overflow on ability list")
				return;
			}
			if(abilityIndex >= 0) {
				ability = Abilities.list[abilityIndex];
			}
			if(num == ball_player.num)
				ball_player.loadoutUnseen = true;
			if(index2 == 0) { //boots
				global.loadout[num,index2] = passiveSprite;
				if(global.teamNum[num] == global.teamNum[ball_player.num]) //if on same team, update known loadouts
					global.knownLoadout[num,index2] = passiveSprite;
			}
			else if(index2 < 4) { //update one of your ability slots
				if(num == ball_player.num)
					scr_abilitySet(abilityIndex, index2);
				global.loadout[num,index2] = ability;
				if(global.teamNum[num] == global.teamNum[ball_player.num]) //if on same team, update known loadouts
					global.knownLoadout[num,index2] = ability;
			}
			else if(index2 == 4) {
				if(global.loadout[num,4] == 0)
					global.loadout[num,4] = 1
				else
					global.loadout[num,4] = ability;
				if(global.teamNum[num] == global.teamNum[ball_player.num] || global.teamNum[ball_player.num] == 0) //if on same team, update known loadouts
					global.knownLoadout[num,index2] = ability;
			}
			else { //add new passive
				if(num == ball_player.num) {
					passiveOb.passiveGet(ball_game.buffer);
				}
				passiveOb.otherGet(num);
				global.loadoutSize[num]++;
				global.loadout[num,global.loadoutSize[num]] = passiveOb.sprite;
				if(global.teamNum[num] == global.teamNum[ball_player.num] || global.teamNum[ball_player.num] == 0) //update known loadout 
					global.knownLoadout[num,global.loadoutSize[num]] = passiveOb.sprite;
				else
					global.knownLoadout[num,global.loadoutSize[num]] = 0;
					
			}
			show_debug_message(global.loadout[num,index2])
		break;
		case "Loadout Swap":
			show_debug_message("loadout switch")
			num = buffer[? "Num"]
			index1 = buffer[? "Slot1"]
			index2 = buffer[? "Slot2"]
			swap = global.loadout[num,index1]
			global.loadout[num,index1] = global.loadout[num,index2]
			global.loadout[num,index2] = swap;
			global.knownLoadout[num,index1] = global.loadout[num,index1]
			global.knownLoadout[num,index2] = global.loadout[num,index2]
			if(num == ball_player.num) {
				if(global.loadout[num,index1] != 0) {
					scr_abilitySet(global.loadout[num,index1].abilityIndex, index1);
				} else {
					scr_abilitySet(-1, index1);
				}
				if(global.loadout[num,index2] != 0) {
					scr_abilitySet(global.loadout[num,index2].abilityIndex, index2);
				} else {
					scr_abilitySet(-1, index2);
				}
			}
		break;
		case "Passive Lost":
			num = buffer[? "Player Num"];
			passiveIndex = buffer[? "Passive Index"];
			passiveOb = Passives.list[passiveIndex];
			count = buffer[? "Count"];
			repeat(count) {
				if(num == ball_player.num) {
					passiveOb.passiveLose(ball_game.buffer);
					global.passiveCount--;
				}
				passiveOb.otherLose(num);
				
				/*var i = 15;
				var deleted = false;
				while(i < global.loadoutSize[num]) {
					if(!deleted && global.loadout[num,i] == passiveOb.sprite) {
						
					}
					
				}*/
				global.loadoutSize[num]--;
			}
		break;
		case "Sponge Damage":
		show_debug_message("Sponge damage")
			num = buffer[? "Num"]
			show_debug_message(num)
			show_debug_message(buffer);
			if(num == ball_player.num) {
				dmg = buffer[? "Dmg"]
				killer =buffer[? "Killer"]
				ad = buffer[? "Ad"]
				icon = buffer[? "Icon"]
				DoT = buffer[? "DoT"];
				scr_damage(dmg,killer,ad, icon, DoT);
			}
			
		break;
		case "Healing Dealt": //reduce CD on malpractice
			var amount = buffer[? "Amount"];
			if(global.right == Abilities.malpractice)
				global.rightCool = max(global.rightCool - amount/2, 0);
			if(global.space == Abilities.malpractice)
				global.spaceCool = max(global.spaceCool - amount/2, 0);
			if(global.Q == Abilities.malpractice)
				global.QCool = max(global.QCool - amount/2, 0);
			if(global.R == Abilities.malpractice)
				global.RCool = max(global.RCool - amount/2, 0);
		break;
		case "Airborne": //get thrown by toss grab 
			num = buffer[? "Num"]
			xp = buffer[? "X"]
			yp = buffer[? "Y"]
			throwSpd = 20;
			if(ball_player.num == num) { //player gets thrown
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
				if(self.num == other.num) {
					throwTime = other.throwSpd;
					upSpd = 9;
					grav = upSpd * 2/throwTime
				}
			}
		break;
		case "Message": //get message
			num = buffer[? "Num"]
			txt = buffer[? "Message"]
			if(global.teamNum[num] = global.teamNum[ball_player.num] || string_copy(txt,1,2) == "/a") {
				with(ball_message) {
					y -= 60;
				}
				ins = instance_create(20,650,ball_message)
				ins.num = num;
				ins.txt = txt;
			}
		break;
		case "Damage Dealt": //get damage dealt
			dealer = buffer[? "Dealer"]
			receiver =  buffer[? "Target"]
			dmg = buffer[? "Amount"]
			global.players[dealer].totalDamage += dmg;
			if(dealer == ball_player.num) {
				scr_deal_damage(receiver,dmg,buffer[? "Ability"]);
			}
		break;
		case "Monster Respawn":
			monsNum = buffer[? "Num"];
			show_debug_message("Respawn Monster:")
			show_debug_message(monsNum);
			with(obj_monster) {
				if(nameNum == other.monsNum) {
					image_alpha = 1;
					alarm[0] = 1;
				}
			}
		break;
		case "Gun Picked":
			show_debug_message("gun picked")
			gunName = buffer[? "Gun Name"];
			var gunNum = buffer[? "Num"];
			var gunObj = noone;
			if(global.testMode) {
				gunObj =obj_gun;
			} else {
				with(obj_gun) {
					if(self.num == gunNum) { gunObj = self; }
				}
				if(gunObj == noone) {
					gunObj = instance_create(0,0,obj_gun);
					gunObj.num = gunNum;
				}
			}
			scr_gunVisual(gunName,gunObj);
		break;
		case "Telekenesis Point":
			
			var tKNum = buffer[? "User"];
			show_debug_message("Controlled num:" + string(tKNum));
			xp = buffer[? "X"];
			yp = buffer[? "Y"];
			with(ball_player) {
				if(controlledNum == tKNum) {
					show_debug_message("Self controlled:" + string(other.xp));
					controlledX = other.xp;
					controlledY = other.yp;
				}
			}
			with(ball_other) {
				if(controlledNum == tKNum) {
					show_debug_message("other controlled:" + string(other.xp));
					controlledX = other.xp;
					controlledY = other.yp;
				}
			}
		break;
		case "Add Player":
	        num8 = buffer[? "Num"]
			if(num8 != obj_client.index) {
		        global.names[num8] = buffer[? "Name"]
				if(global.teaming != 0) {
					show_debug_message(num8)
					global.teamNum[num8] = buffer[? "Team"]
					show_debug_message(buffer[? "Team"])
				}
				global.loop++;
				scr_createBallPlayer(num8);
			}
		break;
		case "Tower State":
	        nums = buffer[? "ids"]
			maxHealths = buffer[? "maxHps"]
			healths = buffer[? "hps"]
			scr_towerUpdate(nums,healths,maxHealths)
	    break;
		case "Player Xp":
			num = buffer[? "id"];
			xp = buffer[? "xp"];
			xpMax = buffer[? "xpMax"];
			level = buffer[? "level"];
			respawnTimer = buffer[? "respawnTimer"];
			global.players[num].setRespawnTimer = respawnTimer;
			if(num == ball_player.num) {
				global.xp = xp;
				global.xpMax = xpMax;
				global.leveled = level;
			}
		break;
		case "Collect Soul":
			var soulNum = buffer[? "Target"];
			with(ball_corpse) {
				if(self.num == soulNum) {
					instance_destroy();
				}
			}
		break;
	}
	}

}
