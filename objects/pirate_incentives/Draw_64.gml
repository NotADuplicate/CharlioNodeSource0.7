/// @description Draw point incentives
if(keyboard_check(vk_tab)) {
    i = 1;
	yp = 100;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("You are pirate. You must steal booty and kidnap crew members (blue) and make it back alive"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Press shift to see escape pod"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Press B to use buy menu"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Capture crew members by bringing them to your escape pod"));
	
	
    yp = 550;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("1 Point for every 5 booty you steal"));
    yp+= 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("2 points for every crew member you capture"));
}