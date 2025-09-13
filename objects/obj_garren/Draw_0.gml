/// @description Insert description here
// You can write your code in this editor
if(dead) {
	draw_sprite_ext(sprite_index,0,xpos,ypos,image_xscale,image_yscale,0,c_white,image_alpha)
}
else if(place_meeting(ball_player.x,ball_player.y,obj_regen) == false || keyboard_check(ord("M"))) {
	//draw_healthbar(x-60,y-50,x+60,y-75,(hp/maxhp)*100,c_ltgray,c_red,c_green,1,true,true);
	draw_self();
}
if(poison) 
	draw_sprite_ext(spr_poison,0,x,y-120,1,1,0,c_white,poison/100);
if(collision_line(xpos,ypos,ball_player.x,ball_player.y,ball_wall,false,true) == noone)
	draw_healthbar(x-50,y-70,x+50,y-50,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
if(swinging) 
	draw_sprite(spr_warning,0,x,y-10);