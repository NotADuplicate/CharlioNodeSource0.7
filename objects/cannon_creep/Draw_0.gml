/// @description Health
if(side = -1)
	draw_healthbar(x-4,y-20,x+36,y-16,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
else
	draw_healthbar(x-36,y-20,x+2,y-16,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
draw_self()