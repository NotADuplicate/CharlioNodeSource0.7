/// @description Draw point incentives
if(keyboard_check(vk_tab)) {
    i = 1;
	yp = 150;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("You are a Man of The Federation. Keep the crew alive and kill all pirates."));
    yp+= 50;
    yp = 550;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("Kill a pirate"));
    yp+= 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Kill the beast"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Keep all allies alive and on ship"));
}