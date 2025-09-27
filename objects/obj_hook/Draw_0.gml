/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_line(x,y,link.x,link.y)
if((link.x < 10 || link.y < 10) && link != self) {
	instance_destroy();
}