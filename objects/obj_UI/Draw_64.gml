/// @description Draw chat, circle ranges, and loading tips

if(global.typing) {
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_rectangle_color(0,690,400,710,c_gray,c_gray,c_gray,c_gray,false)
	draw_text_ext(0,700,keyboard_string,30,400)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	if(global.stun < 5)
		global.stun = 5;
}

if(global.dead && global.shop == false && global.ballGameOver == 0) {
	draw_rectangle_color(0,10,1024,30,c_gray,c_gray,c_gray,c_gray,false)
	draw_text(512,10,ball_game.lore);
}
if(ball_game.held && global.shop == false && global.dead == false && ball_game.range > 5) {
	var vx = camera_get_view_x(view_camera[0]);
	var vy = camera_get_view_y(view_camera[0]);
	draw_circle(ball_player.x-vx,ball_player.y-vy,ball_game.range,true)
}