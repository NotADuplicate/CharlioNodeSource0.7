/// @description Insert description here
// You can write your code in this editor
if(beast) {
	if(cloak < 100)
		draw_healthbar(x-20,y+28,x+20,y+24,cloak,c_ltgray,c_blue,c_blue,0,true,true);
	draw_healthbar(x-20,y-28,x+20,y-21,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
	draw_self();
	draw_text(x,y-50,string_hash_to_newline(global.names[num]));
}
else {
	draw_healthbar(x-20,y-20,x+20,y-16,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
	draw_self();
	draw_text(x,y-40,string_hash_to_newline(global.names[num]));



	//Waypoint
	if(keyboard_check(vk_shift) && pirate) {
		draw_sprite_ext(spr_bolt,0,x,y,1,1,point_direction(x,y,obj_escape.x,obj_escape.y),c_white,1)
	}
}