/// @description Insert description here
// You can write your code in this editor
if(trail != 0) {
	if(exploding == false)
		draw_line(x,y,trail.x,trail.y)
	else
		draw_line_color(x,y,trail.x,trail.y,c_red,c_red)
}