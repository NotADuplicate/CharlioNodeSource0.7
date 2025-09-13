/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(vk_tab)) {
	if(global.players[num].garren) {
		nameCol = c_purple;
	} else {
		nameCol = global.teamNum[num] == -1 ? c_teal : c_red;
	}
	if(global.teamNum[num] == -1) { //draw box for left team
		center = fa_left;
		draw_rectangle_color(0,y-20,500,y+120,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		draw_set_halign(fa_right);
		draw_text_transformed_color(480,y,global.names[num],2,2,0,nameCol,nameCol,nameCol,nameCol,1);
		if(global.players[num].respawnTimer > 0) { //say respawn timer
			draw_text(480,y-15,"Respawn: " + string(global.players[num].respawnTimer-0.5))
		}
		else if(global.testMode == false){ //if they're living show ping
			draw_text(480,y-15,"Ping: " + string(global.ping[num]))
		}
		draw_text(450,y+40,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + ")")
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
		draw_text(574,y+40,"(" + string(global.kills[num]) + "/" + string(global.deaths[num]) + ")")
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
			scr_stats_UI(xp,y+16,global.knownLoadout[num,i], self, "hover"+string(i),-1);
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
		scr_stats_UI(xp,y+16,global.knownLoadout[num,i], self, "hover"+string(i),-1);
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
		if(obj_garren.dead) 
			draw_text(540,35,scr_minutes(round(obj_garren.timer)));
	}
	draw_set_halign(fa_center)
}