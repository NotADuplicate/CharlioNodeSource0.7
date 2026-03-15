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
}