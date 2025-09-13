/// @description Insert description here
// You can write your code in this editor
draw_self();
if(stasis) {
	draw_line(x,y,x+stasisx*2,y+stasisy*2);
}

if(spellShield > 0)
	draw_sprite_ext(spr_spellShield,0,x,y,3,3,0,c_white,spellShield/100);
	
if(frost > 0)
	draw_sprite_ext(spr_frost,0,x,y-70,1,1,0,c_white,frost/100);
	
if(global.garren != 0) {
	draw_sprite_ext(spr_arrow,0,x,y,global.garren,1,0,c_white,1);
}

if(oil > 0) 
	draw_sprite_ext(spr_oil,0,x,y-60,1,1,0,c_white,oil/100);
	
if(inversion > 0) {
	draw_sprite_ext(spr_inversion,0,x,y-(30*(image_yscale/2+.5)),1,1,0,c_white,inversion/30);
	inversion--;
}

if(drone != 0) {
	draw_sprite(spr_drone,0,x,y)
}