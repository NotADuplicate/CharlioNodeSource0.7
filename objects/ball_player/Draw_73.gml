/// @description draw gun stats bc ball_game no work
	if(global.attack == obj_ARbullet) {
		draw_text(ball_player.x,ball_player.y-70,ball_game.bullets)
	}
	else if(global.attack == virgin_bullet) {
		draw_text(ball_player.x,ball_player.y-70,global.chargeGun+1)
	}
	else if(global.attack == chad_bullet) {
		draw_text_color(ball_player.x,ball_player.y-70,global.chargeGun+1,c_red,c_red,c_red,c_red,1)
	}
/*if(global.gameMode == "Royale"){
with(ball_other) {
	if(seen == 0 || sameTeam) {
		draw_healthbar(x-20,y-(24*(image_yscale/2+.5)),x+20,y-(18*(image_yscale/2+.5)),(hp/maxhp)*100,c_ltgray,c_red,c_green,0,true,true);
	if(hp > maxhp)
		draw_healthbar(x-20,y-(24*(image_yscale/2+.5)),x+20,y-(18*(image_yscale/2+.5)),200*(hp-maxhp)/maxhp,c_green,c_aqua,c_aqua,0,true,true);
		if(global.healthText)
			draw_text(x,y-30*(image_yscale/2+.5),round(hp));
		draw_self();
		if(sameTeam || global.ammoSeeing)
			draw_healthbar(x-20,y+24,x+20,y+18,(ammo/maxAmmo)*100,c_ltgray,c_red,c_green,0,true,true);
		draw_text(x,y-50*(image_yscale/2+.5),string_hash_to_newline(global.names[num]));
	
		if(blocking) 
			draw_sprite(spr_defense,0,x,y-30*(image_yscale/2+.5));
		if(sponge)
			draw_circle(x,y,300,true);
	}
	///Draw status
	if(bleed > 0)
		draw_sprite(spr_blood,0,x,y-30*(image_yscale/2+.5));
	
	if(milked > 0)
		draw_sprite_ext(spr_milkDrop,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,milked/100);
	
	if(confuse > 0) {
		draw_sprite_ext(spr_confuse,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,confuse/30);
		confuse--;
	}

	if(chummed > 0) {
		draw_sprite_ext(spr_meat,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,chummed/100);
		chummed--;
	}

	if(shield > 0) {
		draw_sprite_ext(spr_sponge,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,shield/100);
		shield--;
	}

	if(magicShield > 0) {
		draw_sprite_ext(spr_magicSponge,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,magicShield/100);
		magicShield--;
	}
	
	if(murderball > 0)
		draw_sprite_ext(spr_deathball,0,x,y-30*(image_yscale/2+.5),0.7,0.7,0,c_white,1);
	
	if(enraged)
		draw_sprite_ext(spr_anger,0,x,y-30*(image_yscale/2+.5),0.7,0.7,0,c_white,1);
	
	if(poison) 
		draw_sprite_ext(spr_poison,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,poison/100);
	
	if(decay > 0)
		draw_sprite_ext(spr_decay,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,decay/100);
	
	if(spellShield > 0)
		draw_sprite_ext(spr_spellShield,0,x,y,2,2,0,c_white,spellShield/100);
	
	if(broken > 0)
		draw_sprite_ext(spr_broken,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,broken/100);
	
	if(frost > 0)
		draw_sprite_ext(spr_frost,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,frost/100);
	
	if(tossGrabbed > 0)
		draw_sprite_ext(spr_hand,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,tossGrabbed/30);
	
	if(stunned > 0) 
		draw_sprite_ext(spr_stun,0,x,y-30*(image_yscale/2+.5),1.5,1.5,stunned*4,c_white,stunned/100);
	
	if(oil > 0) 
		draw_sprite_ext(spr_oil,0,x,y-30*(image_yscale/2+.5),1,1,0,c_white,oil/100);
	
	if(cryo > 0) 
		draw_sprite_ext(HD_ice,0,x,y,.2,.2,0,c_white,cryo/100);
}
}