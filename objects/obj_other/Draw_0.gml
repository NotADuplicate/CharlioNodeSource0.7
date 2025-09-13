/// @description Draw HP
draw_healthbar(x-20,y-20,x+20,y-16,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
draw_self();
draw_text(x,y-40,string_hash_to_newline(global.names[num]));