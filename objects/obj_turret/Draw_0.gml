/// @description Insert description here
// You can write your code in this editor
draw_self()
//draw_text(x,y,pushForce);
draw_healthbar(x-25,y-16,x+5,y-10,100*(hp/maxhp),c_black,c_red,c_green,0,true,true)
if(broken) {
	draw_sprite(spr_broken,0,x,y-25);
}
draw_circle_color(x,y,bigRange,c_red,c_red,true);