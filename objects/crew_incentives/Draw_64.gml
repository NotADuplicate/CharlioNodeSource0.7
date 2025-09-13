/// @description Draw point incentives
if(keyboard_check(vk_tab)) {
    i = 1;
	yp = 150;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("You are a crew member. Pirates can track you so you must turn on generators or escape to survive"));
    yp+= 50;
	
    yp = 550;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("Survive"));
    yp+= 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Stay on the ship"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Don't get captured"));
}