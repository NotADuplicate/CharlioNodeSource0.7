/// @description draw gun stats bc ball_game no work
	if(global.attack == obj_ARbullet) {
		draw_text(ball_player.x,ball_player.y-80,ball_game.bullets)
	}
	else if(global.attack == virgin_bullet) {
		draw_text(ball_player.x,ball_player.y-80,global.chargeGun+1)
	}
	else if(global.attack == chad_bullet) {
		draw_text_color(ball_player.x,ball_player.y-80,global.chargeGun+1,c_red,c_red,c_red,c_red,1)
	}