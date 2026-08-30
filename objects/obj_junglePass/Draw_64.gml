/// @description Draw jungle passives with cooldowns
xp = 50;
yp = 85;
if(garren > 0) {
	draw_sprite_ext(spr_purple,0,xp,60,2,2,0,c_white,1)
	draw_healthbar(xp-15,yp+10,xp+15,yp+15,garren/1.6,c_dkgray,c_white,c_white,0,true,true)
	xp += 80;
}
else {
	if(jungle > 0) {
		draw_sprite_ext(spr_jungle,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,jungle/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"Other jungle buffs don't tick down",self,"hoverJungle",1, -80)
		xp += 50;
	}
	if(ammo > 0) {
		draw_sprite_ext(spr_ammo,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,ammo/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% ammo regen",self,"hoverAmmo",-1, -30)
		xp += 50;
	}
	if(resistance > 0) {
		draw_sprite_ext(spr_spellShield,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,resistance/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% resistance",self,"hoverResistance",-1, -30)
		xp += 50;
	}
	if(defense > 0) {
		draw_sprite_ext(spr_defense,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,defense/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% defense",self,"hoverDefense",-1, -30)
		xp += 50;
		if(xp > 300) { 
			xp = 70;
			yp += 70;
		}
	}
	if(spd > 0) {
		draw_sprite_ext(spr_speed,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,spd/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% move speed",self,"hoverSpd",-1, -30)
		xp += 50;
		if(xp > 300) { 
			xp = 70;
			yp += 70;
		}
	}
	if(dmg > 0) {
		draw_sprite_ext(spr_attack,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,dmg/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% attack damage",self,"hoverDmg",-1, -30)
		xp += 50;
		if(xp > 300) { 
			xp = 70;
			yp += 70;
		}
	}
	if(pwr > 0) {
		draw_sprite_ext(spr_wand,0,xp,yp,0.8,0.8,0,c_white,0.75);
		draw_healthbar(xp-15,yp+10,xp+15,yp+15,pwr/18,c_dkgray,c_white,c_white,0,true,true)
		scr_hover_UI(xp,yp,"+20% ability power",self,"hoverPwr",-1, -30)
		xp += 50;
		if(xp > 300) { 
			xp = 70;
			yp += 70;
		}
	}
}