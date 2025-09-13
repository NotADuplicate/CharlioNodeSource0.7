// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_endThrow(buffer) {
	if(point_distance(ball_player.x,ball_player.y,mouse_x,mouse_y) < global.throwRange) {
		end_x = mouse_x;
		end_y = mouse_y;
	} else {
		var dir = point_direction(ball_player.x,ball_player.y,mouse_x,mouse_y);
		end_x = ball_player.x+lengthdir_x(global.throwRange,dir)
		end_y = ball_player.y+lengthdir_y(global.throwRange,dir)
	}
	with(ball_game) {
		node_send(buffer,"Dir",global.throwing,"X",other.end_x,"Y",other.end_y,"Num",ball_player.num,"Obj",global.thowItem,"eventName","Bullet")
		node_send(buffer, "eventName", "Throw Sprite", "Num", ball_player.num, "Sprite", -1)
	}
	global.throwRange = 0;
}