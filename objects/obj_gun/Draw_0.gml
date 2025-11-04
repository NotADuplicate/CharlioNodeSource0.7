/// @description Decide if seen
if(initialized) {
	if(global.teamNum[num] == global.teamNum[ball_player.num] || global.players[num].seen == false) {
		if(throwing) {
			draw_sprite_ext(throwSprite,0,x,y,sign(image_xscale),1,0,c_white,1)
		}
		else {
			draw_self();
		}
	}
}