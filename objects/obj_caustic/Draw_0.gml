/// @description Draw hp
if(seen) {
	draw_self();
	draw_healthbar(x-20,y-25,x+20,y-21,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
}