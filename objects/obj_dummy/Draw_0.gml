/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_healthbar(x-20,y-(24*(image_yscale/2+.5)),x+20,y-(18*(image_yscale/2+.5)),(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
draw_text(x,y-30*(image_yscale/2+.5),round(hp));

if(poison > 0) 
	draw_sprite_ext(spr_poison,0,x,y-(30*(image_yscale/2+.5)),1,1,0,c_white,poison/100);
	
if(broken > 0) {
	draw_sprite_ext(spr_broken,0,x,y-(30*(image_yscale/2+.5)),1,1,0,c_white,broken/100);
	broken--;
}