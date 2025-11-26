/// @description Draw death recap
if(global.dead) {
	i = 0;
	draw_set_alpha(.5)
	xp = 550 - (array_length(damageDealers)-1)*150;
	
	while(i < array_length(damageDealers)) {
		draw_sprite_ext(buy_gun, 0, xp, 300,2.5,2.5,0,c_white,1);
		if(global.teamNum[damageDealers[i]] == -1)
			draw_set_color(c_blue)
		else
			draw_set_color(c_red)
		draw_text(xp,265,global.names[damageDealers[i]]);
		draw_set_color(c_white)
		
		xp2 = xp - (array_length(damageSources[i])-1)*20;
		q = 0;
		
		while(q < array_length(damageSources[i])) {
			if(damageSources[i,q].icon == 0)
				draw_sprite(spr_attack,0,xp2,300);
			else
				draw_sprite(damageSources[i,q].icon,0,xp2,300);
			draw_text_color(xp2,310,round(damageSources[i,q].dmg),c_red,c_red,c_red,c_red,1);
			xp2 += 40;
			q++;
		}
		i++;
		xp += 300;
	}
	
	draw_set_alpha(1)
}