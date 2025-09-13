/// @description Draw point incentives
if(keyboard_check(vk_tab)) {
    i = 1;
	yp = 150;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("You are the captain. Work with crew (blue) to turn on generators and stop the pirates from stealing booty"));
       yp += 50;
	   
    yp = 550;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("Have less than 5 booty stolen"));
    yp+= 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Have less than 10 booty stolen"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Kill the beast"));
}