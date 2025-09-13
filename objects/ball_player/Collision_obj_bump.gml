/// @description Insert description here
// You can write your code in this editor
if(other.num != num) {
	scr_player_move(other.direction,29);
	if(global.screenShake < 5)
		global.screenShake = 5;
}