draw_set_alpha(alpha);
if((sameTeam || seen) && link.visible) {
	draw_healthbar(round(x)-20,round(y)-(13*(link.image_yscale))-9,round(x)+20,round(y)-(13*(link.image_yscale))-19,(link.hp/link.maxhp)*100,c_ltgray,c_red,c_green,0,true,true);

	if(link.hp > link.maxhp)
		draw_healthbar(round(x)-20,round(y)-(13*(link.image_yscale))-9,round(x)+20,round(y)-(10*(link.image_yscale))-19,200*(link.hp-link.maxhp)/link.maxhp,c_green,c_aqua,c_aqua,0,true,true); //draw overheal

	if(link.object_index == ball_player) {
		draw_healthbar(x-20,y+26,x+20,y+20,(global.ammo/global.maxAmmo)*100,c_ltgray,c_red,c_green,0,true,true);
		if(link.back > 0)
			draw_healthbar(round(x)-30,round(y)-36,round(x)+30,round(y)-28,(link.back/link.backMax)*100,c_ltgray,c_white,c_white,0,true,true);
		if(global.boot == "Charge" && charge > 0) 
			draw_healthbar(round(x)-20,round(y)+34,round(x)+20,round(y)+28,charge/3,c_ltgray,c_white,c_white,0,true,true); //draw charge boots charge
	} else {
		if(sameTeam) 
			draw_healthbar(x-20,y+26,x+20,y+20,(link.ammo/link.maxAmmo)*100,c_ltgray,c_red,c_green,0,true,true);
	}

	if(global.healthText)
		draw_text(round(x),round(y)-(10*(link.image_yscale))-29,round(link.hp));
	
	draw_text(round(x),round(y)-(50*(link.image_yscale/3)) - 35, string_hash_to_newline(global.names[link.num])); //name

	with(link) {
		scr_drawStatus();
	}
}
draw_set_alpha(1);