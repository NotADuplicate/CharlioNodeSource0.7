/// @description Insert description here
// You can write your code in this editor
if(global.ballGameOver != 0) { //just for when the game ends to display all stats
var oldCol = draw_get_color(), oldAlign = draw_get_halign();
var gold = make_color_rgb(201,157,60), ivory = make_color_rgb(232,225,207);
var bg = make_color_rgb(22,24,23), line = make_color_rgb(65,62,49);
var left = global.teamNum[num] == -1 ? 0 : 550;
var right = left + 485;
var nameCol = global.teamNum[num] == -1 ? c_teal : make_color_rgb(195,65,55);
var p = global.players[num];

draw_set_color(bg);
draw_rectangle(left,y-20,right,y+160,false);
draw_set_color(mvp ? gold : line);
draw_rectangle(left+2,y-18,right-2,y+158,true);
draw_set_color(line);
draw_line(left+12,y+20,right-12,y+20);
draw_line(left+12,y+101,right-12,y+101);
draw_line(left+230,y+29,left+230,y+92);

draw_set_halign(fa_left);
draw_set_color(nameCol);
var nameScale = min(2,(mvp ? 225 : 280)/max(1,string_width(global.names[num])));
draw_text_transformed(left+14,y-9,global.names[num],nameScale,nameScale,0);
if(mvp) {
	draw_set_color(gold);
	draw_text(left+248,y-5,"MVP");
}
draw_set_color(ivory);
draw_set_halign(fa_right);
draw_text(right-14,y-5,string(global.kills[num])+" / "+
	string(global.deaths[num])+" / "+string(global.assists[num]));

draw_set_halign(fa_left);
draw_set_color(c_white);
for(var a = 1; a <= 4; a++) {
	var ability = global.knownLoadout[num,a];
	if(a == 4 && ability == 0) continue;
	var ax = left+32+(a-1)*44;
	draw_sprite(spr_white,0,ax,y+56);
	if(ability != 0 && ability != 1) {
		var ui = scr_stats_UI(ability,-1,keyboard_check(vk_control),num);
		scr_hover_UI(ax,y+56,ui[0],self,"hover"+string(a),-1,ui[1]);
		if(sprite_exists(ability.sprite))
			draw_sprite(ability.sprite,0,ax,y+56);
	}
}
var boots = global.knownLoadout[num,0];
if(boots != 0) {
	draw_sprite_ext(spr_white,0,left+207,y+56,.75,.75,0,c_white,1);
	if(sprite_exists(boots))
		draw_sprite_ext(boots,0,left+207,y+56,.75,.75,0,c_white,1);
}
var slot = 0;
for(var a = 5; a <= global.loadoutSize[num] && slot < 12; a++) {
	var passive = global.knownLoadout[num,a];
	if(passive == 0) continue;
	var px = left+254+(slot mod 6)*39;
	var py = y+42+floor(slot/6)*35;
	draw_sprite_ext(spr_white,0,px,py,.75,.75,0,c_white,1);
	if(sprite_exists(passive))
		draw_sprite_ext(passive,0,px,py,.75,.75,0,c_white,1);
	slot++;
}

var stats = [
	[p.totalDamage,450,spr_attack,"DAMAGE"],
	[p.ballPush,200,spr_kick,"BALL PUSH"],
	[p.towerDamage,10,spr_light_spot,"TOWER DMG"],
	[p.healingDealt,95,spr_heal,"HEALING"],
	[p.damageBlocked,200,spr_sponge,"BLOCKED"],
	[p.soulsCollected,2,dead_cowboy,"SOULS"],
	[p.selfDamageBlocked,400,spr_defense,"SELF BLOCK"]
];
var leaders = array_create(7,0);
for(var n = 0; n < instance_number(obj_loadout); n++) {
	var card = instance_find(obj_loadout,n);
	var q = global.players[card.num];
	var values = [q.totalDamage,q.ballPush,q.towerDamage,q.healingDealt,
		q.damageBlocked,q.soulsCollected,q.selfDamageBlocked];
	for(var s = 0; s < 7; s++)
		leaders[s] = max(leaders[s],values[s]);
}
var visibles = [];
for(var s = 0; s < 7; s++) {
	if(stats[s][0] > stats[s][1] || (s == 0 && stats[s][0] == 450))
		array_push(visibles,s);
}
var count = array_length(visibles);
var spacing = min(145,457/max(1,count));
draw_set_halign(fa_center);
for(var v = 0; v < count; v++) {
	var s = visibles[v];
	var sx = left+14+spacing*(v+.5);
	var best = stats[s][0] == leaders[s];
	var value = string(round(stats[s][0]));
	draw_sprite_ext(stats[s][2],0,sx,y+112,.5,.5,0,c_white,1);
	draw_set_color(ivory);
	var labelScale = min(.7,(spacing-6)/max(1,string_width(stats[s][3])));
	draw_text_transformed(sx,y+123,stats[s][3],labelScale,labelScale,0);
	draw_set_color(best ? gold : ivory);
	var valueScale = min(1,(spacing-18)/max(1,string_width(value)));
	draw_text_transformed(sx,y+139,value,valueScale,valueScale,0);
	if(best)
		draw_circle(sx-string_width(value)*valueScale*.5-7,y+144,2,false);
}

if(num == 1) {
	var won = global.ballGameOver == global.teamNum[ball_player.num];
	var resultCol = won ? ivory : make_color_rgb(195,65,55);
	draw_set_halign(fa_center);
	draw_text_ext_transformed_color(530,10,won ? "VICTORY!" : "DEFEAT",
		0,500,2,2,0,resultCol,resultCol,resultCol,resultCol,1);
}
draw_set_color(oldCol);
draw_set_halign(oldAlign);
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
	}
	draw_set_halign(fa_center)
}