/// @description Insert description here
// You can write your code in this editor
if(global.ballGameOver != 0) { //just for when the game ends to display all stats
	nameCol = global.teamNum[num] == -1 ? c_teal : c_red;
	if(global.teamNum[num] == -1) { //draw box for left team
		center = fa_left;
		draw_rectangle_color(0,y-20,485,y+160,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		if(mvp) {
			draw_circle_color(485,y-8,32,c_yellow,c_yellow, false)
			draw_text_transformed_color(485,y-28,"MVP",2,2,0,c_black,c_black,c_black,c_black,1)
		}
		draw_set_halign(fa_right);
		draw_text_transformed_color(485,y,global.names[num],2,2,0,nameCol,nameCol,nameCol,nameCol,1);
		draw_text(435,y+35,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + "/" + string(global.assists[num]) + ")")
		xp = 150;
		passiveXp = 30;
		statXp = 50
	}
	else { //box for right team
		center = fa_right;
		draw_rectangle_color(550,y-20,1040,y+160,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		if(mvp) {
			draw_circle_color(550,y-6,32,c_yellow,c_yellow, false)
			draw_text_transformed_color(560,y-20,"MVP",2,2,0,c_black,c_black,c_black,c_black,1)
		}
		draw_set_halign(fa_left);
		draw_text_transformed_color(550,y,global.names[num],2,2,0,nameCol,nameCol,nameCol,nameCol,1);
		draw_text(644,y+35,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + "/" + string(global.assists[num]) + ")")
		xp = 880;
		passiveXp = 1040;
		statXp = 650
	}
	draw_set_halign(center)
	i = 1;
	repeat(3) { //draw 3 white boxes and abilities
		draw_sprite(spr_white,0,xp,y+16)
		if(global.knownLoadout[num,i] != 0) {
			abilitySprite = global.knownLoadout[num,i].sprite;
			statUi = scr_stats_UI(global.knownLoadout[num,i], -1, keyboard_check(vk_control), num);
			var statText = statUi[0];
			var height = statUi[1];
			scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
			if(sprite_exists(abilitySprite)) {
				draw_sprite(abilitySprite,0,xp,y+16);
			}
		}
		xp += 40 * global.teamNum[num];
		i++;
	}
	if(global.knownLoadout[num,4] != 0) {
		draw_sprite(spr_white,0,xp,y+16)
		abilitySprite = global.knownLoadout[num,4].sprite;
		statUi = scr_stats_UI(global.knownLoadout[num,i], -1, keyboard_check(vk_control), num);
		var statText = statUi[0];
		var height = statUi[1];
		scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
		if(sprite_exists(abilitySprite)) {
			if(global.knownLoadout[num,4] != 1) 
				draw_sprite(abilitySprite,0,xp,y+16);
		}
	}
	if(global.knownLoadout[num,0] != 0) { //boots
		draw_sprite_ext(spr_white,0,passiveXp,y+60,.75,.75,0,c_white,1)
		if(sprite_exists(global.knownLoadout[num,0]))
			draw_sprite_ext(global.knownLoadout[num,0],0,passiveXp,y+60,.75,.75,0,c_white,1)
		passiveXp -= 28 * global.teamNum[num];
	}
	baseXp = passiveXp;
	yp = y+60;
	i = 5;
	repeat(global.loadoutSize[num]-4) { //draw passives
		if(global.knownLoadout[num,i] != 0) {
			draw_sprite_ext(spr_white,0,passiveXp,yp,.75,.75,0,c_white,1)
			if(sprite_exists(global.knownLoadout[num,i]))
				draw_sprite_ext(global.knownLoadout[num,i],0,passiveXp,yp,.75,.75,0,c_white,1)
		}
		passiveXp -= 30 * global.teamNum[num];
		i++;
		if(passiveXp > 400 && passiveXp < 650) {
			passiveXp = baseXp;
			yp += 40;
		}
	}
	numStats = (global.players[num].totalDamage > 450 ? 1 : 0) + (global.players[num].ballPush > 200 ? 1 : 0)
		+ (global.players[num].towerDamage > 10 ? 1 : 0) + (global.players[num].healingDealt > 95 ? 1 : 0)
		+ (global.players[num].soulsCollected > 2 ? 1 : 0) + (global.players[num].damageBlocked > 200 ? 1 : 0)
		+ (global.players[num].selfDamageBlocked > 200 ? 1 : 0);
	xDist = 400 / max(1,numStats);
	draw_set_halign(fa_center)
	if(global.players[num].totalDamage >= 450) {
		draw_sprite(spr_attack, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].totalDamage))
		statXp += xDist;
	}
	if(global.players[num].ballPush > 200) {
		draw_sprite(spr_kick, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].ballPush))
		statXp += xDist;
	}
	if(global.players[num].towerDamage > 10) {
		draw_sprite(spr_light_spot, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].towerDamage))
		statXp += xDist;
	}
	if(global.players[num].healingDealt > 95) {
		draw_sprite(spr_heal, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].healingDealt))
		statXp += xDist;
	}
	if(global.players[num].damageBlocked > 200) {
		draw_sprite(spr_sponge, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].damageBlocked))
		statXp += xDist;
	}
	if(global.players[num].soulsCollected > 2) {
		draw_sprite(dead_cowboy, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].soulsCollected))
		statXp += xDist;
	}
	if(global.players[num].selfDamageBlocked > 400) {
		draw_sprite(spr_defense, 0, statXp, y+110);
		draw_text(statXp,y+130,round(global.players[num].selfDamageBlocked))
		statXp += xDist;
	}
	
	if(num == 1) {//draw timers for drag and garren
		if(global.ballGameOver == global.teamNum[ball_player.num]) {
			text = "VICTORY!"
			color = c_green;
		} else {
			text = "DEFEAT"
			color = c_red
		}
		draw_text_ext_transformed_color(530,10,text, 0, 500, 2,2,0,color,color,color,color,1)
	}
}
else if(keyboard_check(vk_tab)) {
	if(false) {//global.players[num].garren) {
		nameCol = c_purple;
	} else {
		nameCol = global.teamNum[num] == -1 ? c_teal : c_red;
	}
	if(global.teamNum[num] == -1) { //draw box for left team
		center = fa_left;
		draw_rectangle_color(0,y-20,500,y+120,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		draw_set_halign(fa_right);
		draw_text_transformed_color(480,y,global.names[num],2,2,0,nameCol,nameCol,nameCol,nameCol,1);
		show_debug_message(global.players[num].object_index)
		if(global.players[num].respawnTimer > 0) { //say respawn timer
			draw_text(480,y-15,"Respawn: " + string(global.players[num].respawnTimer-0.5))
		}
		else if(global.testMode == false){ //if they're living show ping
			draw_text(480,y-15,"Ping: " + string(global.ping[num]))
		}
		draw_text(450,y+40,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + "/" + string(global.assists[num]) + ")");
		draw_text(375,y+40,"Damage:" + string(round(global.players[num].totalDamage)))
		xp = 200;
		passiveXp = 30;
	}
	else { //box for right team
		center = fa_right;
		draw_rectangle_color(524,y-20,1024,y+120,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		draw_set_halign(fa_left);
		draw_text_transformed_color(544,y,global.names[num],2,2,0,nameCol,nameCol,nameCol,nameCol,1);
		if(global.players[num].respawnTimer > 0) { //say respawn timer
			draw_text(544,y-15,"Respawn: " + string(global.players[num].respawnTimer-0.5))
		}
		else if(global.testMode == false){ //if they're living show ping
			draw_text(544,y-15,"Ping: " + string(global.ping[num]))
		}
		draw_text(564,y+40,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + "/" + string(global.assists[num]) + ")")
		draw_text(629,y+40,"Damage:" + string(round(global.players[num].totalDamage)))
		xp = 824;
		passiveXp = 990;
	}
	draw_set_halign(center)
	i = 1;
	repeat(3) { //draw 3 white boxes and abilities
		draw_sprite(spr_white,0,xp,y+16)
		if(global.knownLoadout[num,i] != 0) {
			abilitySprite = global.knownLoadout[num,i].sprite;
			statUi = scr_stats_UI(global.knownLoadout[num,i], -1, keyboard_check(vk_control), num);
			var statText = statUi[0];
			var height = statUi[1];
			scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
			if(sprite_exists(abilitySprite)) {
				draw_sprite(abilitySprite,0,xp,y+16);
			}
		}
		xp += 40 * global.teamNum[num];
		i++;
	}
	if(global.knownLoadout[num,4] != 0) {
		draw_sprite(spr_white,0,xp,y+16)
		abilitySprite = global.knownLoadout[num,4].sprite;
		statUi = scr_stats_UI(global.knownLoadout[num,i], -1, keyboard_check(vk_control), num);
		var statText = statUi[0];
		var height = statUi[1];
		scr_hover_UI(xp,y+16,statText,self,"hover"+string(i),-1,height)
		if(sprite_exists(abilitySprite)) {
			if(global.knownLoadout[num,4] != 1) 
				draw_sprite(abilitySprite,0,xp,y+16);
		}
	}
	if(global.knownLoadout[num,0] != 0) { //boots
		draw_sprite_ext(spr_white,0,passiveXp,y+60,.75,.75,0,c_white,1)
		if(sprite_exists(global.knownLoadout[num,0]))
			draw_sprite_ext(global.knownLoadout[num,0],0,passiveXp,y+60,.75,.75,0,c_white,1)
		passiveXp -= 28 * global.teamNum[num];
	}
	baseXp = passiveXp;
	yp = y+60;
	i = 5;
	repeat(global.loadoutSize[num]-4) { //draw passives
		if(global.knownLoadout[num,i] != 0) {
			draw_sprite_ext(spr_white,0,passiveXp,yp,.75,.75,0,c_white,1)
			if(sprite_exists(global.knownLoadout[num,i]))
				draw_sprite_ext(global.knownLoadout[num,i],0,passiveXp,yp,.75,.75,0,c_white,1)
		}
		passiveXp -= 30 * global.teamNum[num];
		i++;
		if(passiveXp > 270 && passiveXp < 750) {
			passiveXp = baseXp;
			yp += 40;
		}
	}
	if(num == 1 && global.gameMode != "Royale") {//draw timers for drag and garren
		draw_sprite_ext(spr_purp,0,440,50,.5,.5,0,c_white,1)
		if(obj_drag.dead) 
			draw_text(460,35,scr_minutes(round(obj_drag.timer)));
		draw_sprite_ext(spr_purp,0,520,50,.5,.5,0,c_white,1)
		//if(obj_garren.dead) 
			//draw_text(540,35,scr_minutes(round(obj_garren.timer)));
	}
	draw_set_halign(fa_center)
}