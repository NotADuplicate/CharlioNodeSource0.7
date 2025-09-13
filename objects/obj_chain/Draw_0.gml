/// @description Insert description here
// You can write your code in this editor
if(timer < 0.5) 
	draw_set_color(c_red)
if(ballLinked) {
	draw_line(x,y,obj_bigBall.x,obj_bigBall.y)
}
i = 0;
repeat(10) {
	if(chained[i] != 0) {
		draw_line(x,y,chained[i].x,chained[i].y)
	}
	i++;
}
if(timer < 0.5) 
	draw_set_color(c_white)