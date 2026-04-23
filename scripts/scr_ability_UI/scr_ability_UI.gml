// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ability_UI(xp, yp, ability, cooldown, cooldownMax, button, hoverVar){
	if(ability == 0) {
		return 0;
	}
	
	draw_sprite(spr_white,0,xp,yp)
	draw_sprite(ability.sprite,0,xp,yp)
	if(cooldown != 0) {
		if(cooldown > cooldownMax) { cooldownMax = cooldown; }
		draw_set_alpha(0.5)
		draw_text(xp,yp+28,round(cooldown/global.coolReduc))
		draw_healthbar(xp-16,yp-16,xp+16,yp+16,100*cooldown/cooldownMax,c_white,c_black,c_black,3,false,false)
		draw_set_alpha(1)
	}
	else
		draw_text(xp,yp+28,button)
	if(ability.ammoCost > global.ammo) {
		draw_set_alpha(0.5)
		draw_rectangle_color(xp-16,yp-16,xp+16,yp+16,c_red,c_red,c_red,c_red,false);
		draw_set_alpha(1)
	}
	statUi = scr_stats_UI(ability, 1);
	var statText = statUi[0];
	var height = statUi[1];
	scr_hover_UI(xp,yp,statText,self,hoverVar,1,height)
	return cooldownMax; //Send this back so player can update its values
}