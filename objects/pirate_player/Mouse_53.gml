///Shoot crew pistol
if(beast) { //if unleashed then dart or dash
	if(sprite_index = spr_beast) {//unleashed
		if(reload == 0) {
			if(image_alpha == 1) { //dash
				jumping = true;
				reload = 30;
				alarm[2] = 15;
				xspd = lengthdir_x(25,point_direction(x,y,mouse_x,mouse_y));
				yspd = lengthdir_y(25,point_direction(x,y,mouse_x,mouse_y));
				scr_pirate_shoot(0,obj_charge);
			}
			else {//dart
				reload = 60;
				scr_pirate_shoot(0,obj_dart)
			}
		}
	}
}
if(MTF) {
	if(reload == 0 && clip > 0) {
		scr_pirate_shoot(0,obj_shotgun1)
		reload = 10;
		clip--;
	}
}
if(pirate == false) {
	if(reload == 0 && clip > 0) {
		scr_pirate_shoot(dev,obj_bullet1)
		reload = 10;
		clip--;
		dev = 20;
	}
}