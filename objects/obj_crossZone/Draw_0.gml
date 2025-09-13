/// @description Draw hp
	draw_self();
	draw_healthbar(x-20,y-20,x+20,y-15,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
	draw_circle(x,y,200,true);