// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_outside(){
	with(ball_player) {
		if(place_meeting(x,y,ball_wall)) {
			wall = instance_place(x,y,ball_wall)
			if(wall.image_xscale > wall.image_yscale) { //move vertically out of horizontal walls
				while(place_meeting(x,y,ball_wall)) {
					y+=sign(y-wall.y)*3
				}
			}
			else { //move vertically out of horizontal walls
				while(place_meeting(x,y,ball_wall)) {
					x+=sign(x-wall.x)*3
				}
			}
		}
	}
}