/// @description Draw scores
    i = 1;
    yp = 100;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(100,100,string_hash_to_newline("Name:"));
    draw_text(700,100,string_hash_to_newline("Total Score:"));
	draw_text(400,100,string_hash_to_newline("Score Increase:"));
    yp = 200;
    repeat(array_length_1d(global.names)-1) {
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(100,yp,string_hash_to_newline(global.names[i]));
		draw_text(400,yp,string_hash_to_newline(global.kills[i]));
        draw_text(700,yp,string_hash_to_newline(global.wins[i]));
        i++;
        yp += 50;
    }