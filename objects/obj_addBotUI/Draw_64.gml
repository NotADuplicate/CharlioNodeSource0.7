/// @description Insert description here
// You can write your code in this editor
if(global.connected && !global.loadoutView) {
	if(!hovering) {
		draw_set_alpha(0.3)
	} else {
		draw_set_alpha(1)
	}
	if(team == -1) { //draw box for left team
		draw_rectangle_color(0,y,500,y+height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		xp = 200;
		draw_sprite(spr_plus,0,50,y+16);
	}
	else { //box for right team
		draw_rectangle_color(524,y,1024,y+height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		xp = 700
		draw_sprite(spr_plus,0,950,y+16);
	}
	draw_set_halign(center)
	draw_text_transformed(xp,y,"Add Bot",1.5,1.5,0);
	draw_set_alpha(1)
	
	draw_set_halign(fa_center)
}