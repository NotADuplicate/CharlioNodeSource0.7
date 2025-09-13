/// @description Insert description here
// You can write your code in this editor
if(global.typing == false && ball_player.y > 10 && global.shop == false && global.options == false) {
	if(keyboard_check_pressed(global.binded2Right)) {
		scr_ability_pressed("right")
	}
	if(keyboard_check_pressed(global.spacekey)) {
		scr_ability_pressed("space")
	}
	if(keyboard_check_pressed(global.Qkey)) {
		scr_ability_pressed("Q")
	}
	if(keyboard_check_pressed(global.Rkey)) {
		scr_ability_pressed("R")
	}
	if(keyboard_check_pressed(global.jamesKey)) {
		if(ball_player.sponge) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 33)
		}
		else if(spongeable) {
			node_send(buffer,"eventName","Status","Target",ball_player.num,"Status Num", 29)
		}
	}
	if(keyboard_check_pressed(global.KBkey) && KBable) {
		if(global.pushSpd = 1) {
			global.pushSpd = .7;
			ball_player.knockback = 1;
			ball_player.jugg = 30;
			ball_player.nugg = 0;
		}
		else {
			ball_player.knockback = .5;
			global.pushSpd = 1;
			ball_player.nugg = 30;
			ball_player.jugg = 0
		}
	}
}