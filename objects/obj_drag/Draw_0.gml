/// @description Theres a illegal pointer error, cant figure it out
if(instance_exists(ball_player)) {
	if(dead) {
		draw_sprite_ext(sprite_index,0,xpos,ypos,image_xscale,image_yscale,0,c_white,image_alpha)
		draw_text(xpos,ypos,round(timer));
	}
	else if(place_meeting(ball_player.x,ball_player.y,obj_regen) == false || keyboard_check(ord("M"))) {
		draw_self();
	}
	if(poison) 
		draw_sprite_ext(spr_poison,0,x,y-120,1,1,0,c_white,poison/100);
	
	//if(keyboard_check(ord("M")) == false)
	if(collision_line(xpos,ypos,ball_player.x,ball_player.y,ball_wall,false,true) == noone)
		draw_healthbar(x-(20*image_xscale),y-(20*image_xscale),x+(20*image_xscale),y-(16*image_xscale),(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
	else if(hp < maxhp) 
		draw_healthbar(x-(20*image_xscale),y-(20*image_xscale),x+(20*image_xscale),y-(16*image_xscale),(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
}
	//draw_healthbar(x-(20*image_xscale),y-90,x+(20*image_xscale),y-110,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);