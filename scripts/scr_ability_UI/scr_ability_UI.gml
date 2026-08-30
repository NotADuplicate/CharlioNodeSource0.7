// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_UI(xp, yp, ability, cooldown, cooldownMax, button, hoverVar){
	if(ability == 0) {
		return 0;
	}
	
	draw_sprite_ext(spr_frameSlot,0,xp,yp,0.35,0.35,0,c_white,0.6)
	draw_sprite(ability.sprite,0,xp,yp)
	draw_sprite_ext(spr_frame,0,xp,yp+22,(string_length(button)*8 + 10)/136,0.25,0,c_white,0.6);
	if(cooldown != 0) {
		if(cooldown > cooldownMax) { cooldownMax = cooldown; }
		draw_healthbar(xp-16,yp-16,xp+16,yp+16,100*cooldown/cooldownMax,c_white,c_black,c_black,3,false,false)
		draw_text_transformed(xp,yp+17,round(cooldown/global.coolReduc),0.75,0.75,1)
	}
	else {
		draw_text_transformed(xp,yp+17,button,0.75,0.75,0)
	}
	if(ability.ammoCost > global.ammo) {
		draw_set_alpha(0.5)
		draw_rectangle_color(xp-16,yp-16,xp+16,yp+16,c_red,c_red,c_red,c_red,false);
		draw_set_alpha(0.7)
	}
	
	statUi = scr_stats_UI(ability, 1, keyboard_check(vk_control), ball_player.num);
	var statText = statUi[0];
	var height = statUi[1];
	scr_hover_UI(xp,yp,statText,self,hoverVar,1,height)
	return cooldownMax; //Send this back so player can update its values
}