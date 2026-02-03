/// @description Insert description here
// You can write your code in this editor
if(global.connected && !global.loadoutView) {
	if(team == -1) { //draw box for left team
		draw_rectangle_color(0,y,500,y+height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		xp = 200;
	}
	else { //box for right team
		draw_rectangle_color(524,y,1024,y+height,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false)
		xp = 700
	}
	draw_set_halign(center)
	draw_text_transformed_color(xp,y,named,2,2,0,col,col,col,col,1);
	
	if(!obj_client.loadoutPicking) {
		if(ready) {
			draw_sprite(spr_checkedbox,0,xp-64,y+20);
		}
		else {
			draw_sprite(spr_checkbox,0,xp-64,y+20);
		}
	} else if(obj_client.loadoutPickingIndex == num) { //pending to pick
		draw_sprite(spr_yellow,0,xp-64,y+20);
	}
	
	if(loadoutPicked) {
		xp -= 155
		for(i = 0; i < 8; i++) {
			if(loadout[i] != undefined) 
				draw_sprite(Abilities.list[loadout[i]].sprite,0,xp+i*40,y+50)
		}
		if(loadout[8] != undefined)
			draw_sprite(loadout[8],0,xp+350,y+50)
		if(loadout[9] != undefined)
			draw_sprite(loadout[9],0,xp+410,y+50)
	}
	
	draw_set_halign(fa_center)
}