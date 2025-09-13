draw_self()
if(selected == 1) {
	draw_rectangle_color(x-16,y-16,x+16,y+16,c_green,c_green,c_green,c_green,true)
	draw_rectangle_color(x-15,y-15,x+15,y+15,c_green,c_green,c_green,c_green,true)
	draw_rectangle_color(x-17,y-17,x+17,y+17,c_green,c_green,c_green,c_green,true)
	draw_text(1335,4673,str)
}
draw_sprite(spr_clock,0,x,y)
draw_sprite(spr,0,x,y)