/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_healthbar(x-20,y-(34*(image_yscale/2+.5)),x+20,y-(28*(image_yscale/2+.5)),(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
draw_text(x,y-39*(image_yscale/2+.5),round(hp));
scr_drawStatus();