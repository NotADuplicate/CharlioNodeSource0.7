/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

	dead = true
	garrenBuff = true;
	image_alpha = .1;
	timer = deathTime
	x = 0;
	y = 0;

if(global.teamNum[num] == global.teamNum[ball_player.num] && global.dead == false) {
		scr_get_buff("Ammo", global.jungle, 5);
		scr_get_buff("Damage", global.jungle, 5);
		scr_get_buff("Speed", global.jungle, 5);
		scr_get_buff("Resistance", global.jungle, 5);
		scr_get_buff("Defense", global.jungle, 5);
		scr_get_buff("Power", global.jungle, 5);
		obj_junglePass.garren = 5400;
	}