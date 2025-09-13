/// @description Draw scores
if(keyboard_check(vk_tab)) {
    i = 1;
    yp = 100;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(100,100,string_hash_to_newline("Name:"));
    draw_text(300,100,string_hash_to_newline("Kills:"));
    draw_text(500,100,string_hash_to_newline("Deaths:"));
    draw_text(700,100,string_hash_to_newline("Wins:"));
    yp = 200;
    repeat(array_length_1d(global.names)-1) {
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(100,yp,string_hash_to_newline(global.names[i]));
        draw_text(300,yp,string_hash_to_newline(global.kills[i]));
        draw_text(500,yp,string_hash_to_newline(global.deaths[i]));
        draw_text(700,yp,string_hash_to_newline(global.wins[i]));
        i++;
        yp += 50;
    }
}

