/// @description Draw jungle passives with cooldowns
xp = 70;
if(garren > 0) {
	draw_sprite_ext(spr_garen,0,xp,60,.1,.1,0,c_white,1)
	draw_healthbar(xp-30,80,xp+30,90,garren/36,c_dkgray,c_white,c_white,0,true,true)
	xp += 80;
}
else {
	if(jungle > 0) {
		draw_sprite(spr_jungle,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,jungle/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(ammo > 0) {
		draw_sprite(spr_ammo,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,ammo/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(resistance > 0) {
		draw_sprite(spr_spellShield,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,resistance/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(defense > 0) {
		draw_sprite(spr_defense,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,defense/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(spd > 0) {
		draw_sprite(spr_speed,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,spd/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(dmg > 0) {
		draw_sprite(spr_attack,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,dmg/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
	if(pwr > 0) {
		draw_sprite(spr_wand,0,xp,60)
		draw_healthbar(xp-30,80,xp+30,90,pwr/18,c_dkgray,c_white,c_white,0,true,true)
		xp += 80;
	}
}