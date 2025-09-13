// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_stats_UI(xp, yp, ability, object, hoverVar, up){
	draw_set_halign(fa_center);
	mouseX = mouse_x - camera_get_view_x(view_camera[0]);
	mouseY = mouse_y - camera_get_view_y(view_camera[0]);
	if(mouseX > xp-22 && mouseX < xp+22 && mouseY > yp-22 && mouseY < yp+22) {
		hover = variable_instance_get(object,hoverVar)
		variable_instance_set(object, hoverVar, hover+1);
		if(hover < 4) {
			return;
		}
		var alpha = min(hover/15,0.8)
		draw_set_alpha(alpha);
		
		var statString =  "Ammo: "+string(ability.ammoCost) + "\nCooldown: " + string(ability.cooldown);
		var height = 60*up;
		if(variable_instance_exists(ability, "damage")) {
			statString += "\nDamage: "+string(ability.damage);
			height+=25*up;
		} 
		if(variable_instance_exists(ability, "duration")) {
			statString += "\nDuration: "+string(ability.duration);
			height+=25*up;
		}
		if(variable_instance_exists(ability, "dps")) {
			statString += "\nDPS: "+string(ability.dps);
			height+=25*up;
		}
		if(variable_instance_exists(ability, "critDamage")) {
			statString += "\nCrit Damage: "+string(ability.critDamage);
			height+=25*up;
		}
		if(variable_instance_exists(ability, "maxDamage")) {
			statString += "\nMax Damage: "+string(ability.maxDamage);
			height+=25*up;
		}
		if(variable_instance_exists(ability, "healing")) {
			statString += "\nHealing: "+string(ability.healing);
			height+=25*up;
		}
		draw_rectangle_color(xp-70,yp-20*up-height,xp+70,yp-20*up,c_grey,c_grey,c_grey,c_grey,false);
		if(up == 1) {
			draw_text(xp,yp-height-20,statString);
		} else {
			draw_text(xp,yp+20,statString);
		}
		draw_set_alpha(1);
	}
	else {
		variable_instance_set(object, hoverVar, 0);
	}
}