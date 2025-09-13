/// @description Draw box on surface
		draw_sprite_ext(spr_border,0,x,y,2,2,0,c_white,1);
		if(selected) {
			draw_text(x+40,y-20,keyboard_string);
		}
		else
			draw_text_transformed_color(x+40,y-20,"SEARCH",2,2,0,c_white,c_white,c_white,c_white,1);