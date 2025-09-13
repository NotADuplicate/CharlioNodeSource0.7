/// @description Draw point incentives
if(keyboard_check(vk_tab)) {
    i = 1;
	yp = 100;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("You are the beast! You start disarmed and must arm yourself and then kill people and escape."));
	yp += 80
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Right Click to cloak"));
	if(pirate_player.sprite_index == spr_beast) {
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Attacking while cloaked will mark a target"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Attacking while uncloaked will dash, killing any marked targets"));
	}
	else {
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("You can arm yourself by touching 2 seperate ACTIVE generators"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Going below 1/3 health will arm you"));
	}
	
	
    yp = 550;
    draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
    draw_text(512,yp,string_hash_to_newline("Survive"));
    yp+= 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Escape"));
       yp += 50;
        draw_rectangle_color(0,yp-5,1100,yp+25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
        draw_text(512,yp,string_hash_to_newline("Kill 2 people"));
}