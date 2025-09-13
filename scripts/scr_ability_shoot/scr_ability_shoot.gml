// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_shoot(obj){
	node_send(ball_game.buffer,"eventName","Bullet","Num",ball_player.num,"X", ball_player.x, "Y", ball_player.y, "Obj", obj, "Dir", point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y))
}