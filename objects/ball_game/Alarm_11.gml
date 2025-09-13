/// @description TP to mark
global.marked = global.markLocked;
if(global.marked.x > 10 && global.marked.y > 10 && global.dead == false) {
					global.pointDir = point_direction(ball_player.x,ball_player.y,global.marked.x,global.marked.y)
					ball_player.x = global.marked.x +lengthdir_x(35,global.pointDir)
					ball_player.y = global.marked.y +lengthdir_y(35,global.pointDir)
					with(ball_player) {
						while(place_meeting(x,y,ball_wall)) {
							x -= lengthdir_x(5,global.pointDir)
							y -= lengthdir_y(5,global.pointDir)
						}
					}
}