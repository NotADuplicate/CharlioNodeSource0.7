/// @description Draw HP
//draw_text(x,y-32,hp);
draw_healthbar(x-20,y-20,x+20,y-16,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
//draw_text(x,y-30,global.invincibility);
draw_self();
draw_text(500,30,string_hash_to_newline(global.ammo));
draw_text(x,y-40,string_hash_to_newline(global.names[num]));
