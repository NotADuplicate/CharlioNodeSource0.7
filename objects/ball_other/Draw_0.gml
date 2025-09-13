/// @description Draw HP
//if(global.gameMode != "Royale") {
if(seen == 0 || sameTeam) {
	draw_healthbar(round(x)-20,round(y)-(10*(image_yscale))-5,round(x)+20,round(y)-(10*(image_yscale))-15,(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);

if(hp > maxhp)
	draw_healthbar(x-20,y-(24*(image_yscale/2+.5)),x+20,y-(18*(image_yscale/2+.5)),200*(hp-maxhp)/maxhp,c_green,c_aqua,c_aqua,0,true,true);

	if(global.healthText)
		draw_text(round(x),round(y)-(10*(image_yscale))-20,round(hp));
		
	draw_self();
	if(sameTeam || global.ammoSeeing)
		draw_healthbar(x-20,y+24,x+20,y+18,(ammo/maxAmmo)*100,c_ltgray,c_red,c_green,0,true,true);
		
	draw_text(round(x),round(y)-(50*(image_yscale/3)) - 27,string_hash_to_newline(global.names[num])); //name
	
	if(blocking) 
		draw_sprite(spr_defense,0,x,y);
}
///Draw status
	if(sponge)
		draw_circle(x,y,300,true);
		
if(shield > 0) {
	draw_sprite_ext(spr_sponge,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,shield/100);
	shield--;
}
	
scr_drawStatus();
	
//}