/// @description Draw shop GUI
if(height > 0) {
	draw_rectangle_color(xp,yp,xp2,yp+height,rectColor,rectColor,rectColor,rectColor,false);
	draw_line_width_color(xp,yp,xp2,yp,6,borderColor,borderColor);
	draw_line_width_color(xp,yp+height,xp2,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp,yp,xp,yp+height,6,borderColor,borderColor);
	draw_line_width_color(xp2,yp,xp2,yp+height,6,borderColor,borderColor);
}

if(surface_exists(global.shopSurf) == false) {
	global.shopSurf = surface_create(950,700);
}

if(height > 1 && wipe == false) {
	draw_surface_part(global.shopSurf,0,0,xp2-xp,height,xp,yp);
}

surface_set_target(global.shopSurf);

if(tabs) {
	var abilityTabColor = rectColor;
	var passiveTabColor = rectColor;

	if(global.shopState == "Abilities")
		abilityTabColor = tabsColor;
	else
		passiveTabColor = tabsColor;

	draw_rectangle_color(0,0,475,60,abilityTabColor,abilityTabColor,abilityTabColor,abilityTabColor,false);
	draw_rectangle_color(475,0,950,60,passiveTabColor,passiveTabColor,passiveTabColor,passiveTabColor,false);

	draw_line_width_color(0,0,950,0,2,borderColor,borderColor);
	draw_line_width_color(0,60,950,60,2,borderColor,borderColor);
	draw_line_width_color(475,0,475,60,2,borderColor,borderColor);

if(global.shopState == "Abilities") {
	draw_set_alpha(0.28);
	draw_rectangle_color(
		8, 51, 467, 60,
		tabGlowColor, tabGlowColor,
		tabGlowColor, tabGlowColor,
		false
	);

	draw_set_alpha(1);
	draw_rectangle_color(
		8, 56, 467, 60,
		borderColor, borderColor,
		borderColor, borderColor,
		false
	);
}
else {
	draw_set_alpha(0.28);
	draw_rectangle_color(
		483, 51, 942, 60,
		tabGlowColor, tabGlowColor,
		tabGlowColor, tabGlowColor,
		false
	);

	draw_set_alpha(1);
	draw_rectangle_color(
		483, 56, 942, 60,
		borderColor, borderColor,
		borderColor, borderColor,
		false
	);
}

	draw_text_transformed(290,20,"Abilities",2,2,0);
	draw_text_transformed(634,20,"Passives",2,2,0);
}
else {
	draw_rectangle_color(0,0,950,60,rectColor,rectColor,rectColor,rectColor,false);
}

if(wipe) {
	draw_rectangle_color(0,60,950,700,rectColor,rectColor,rectColor,rectColor,false);
}

switch(global.shopState) {
	case "Abilities":
		draw_line_width_color(650,60,650,700,2,borderColor,borderColor);
		
		if(recentlyHeld > 0) {
			draw_rectangle_color(0,80,950,700,rectColor,rectColor,rectColor,rectColor,false);
			with(inst_utility) {
				draw_sprite(sprite0,0,x,y-4000);
				draw_sprite(utility.sprite,0,x,y-4000);
			}
			recentlyHeld--;
		}

		if(global.utilityHeld) {
			recentlyHeld = 2;
		}

		draw_rectangle_color(651,80,940,700,rectColor,rectColor,rectColor,rectColor,false);

		var textY = 180
		if(global.utilityClass != "") {
			draw_sprite_ext(global.utilityClass.sprite,0,785,120,2,2,0,c_white,1)
			draw_text_ext_transformed(785,textY,global.utilityClass.name,25,260,2,2,0);
			textY += string_height_ext(global.utilityClass.name,25,260)*2 + 20;
			draw_text_ext(785,textY,global.utilityClass.text,24,250);
			textY += string_height_ext(global.utilityClass.text,24,250) + 20;
			draw_line_color(700,textY,890,textY,borderColor,borderColor)
			draw_line_color(795,textY+15,795,textY+80,borderColor,borderColor)
			textY += 25;
			draw_text(730,textY,"Ammo Cost")
			draw_text(870,textY,"Cooldown")
			textY += 25;
			draw_text_transformed(730,textY,global.utilityClass.ammoCost,2,2,0)
			draw_text_transformed(870,textY,string(global.utilityClass.cooldown) + "s",2,2,0)
			draw_text(795,565,"EQUIP TO SLOT")
		}

		/*if(global.free == 0)
			draw_text(770,600,"Swap out an ability for free!");
		else
			draw_text(770,600,string(round(global.free)) + " seconds until free swap");*/
	break;
	case "Passives":
		if(!instance_exists(obj_tutorial) || obj_tutorial.stage > 7) {
			draw_text_transformed(260,68,"Mobility",2,2,0);
			draw_text_transformed(260,173,"Offense",2,2,0);
			draw_text_transformed(260,303,"Defense",2,2,0);

			if(!instance_exists(obj_tutorial) || obj_tutorial.stage > 13) {
				draw_text_transformed(260,433,"Resources",2,2,0);
				draw_text_transformed(260,553,"Utility",2,2,0);
			}
		}
	break;
}

if(!global.shop) {
	if(height > 0)
		height -= 100;
}
else if(height < 700) {
	if(height < 100)
		wipe = true;

	height += 70;
}

surface_reset_target();

if(height > 1 && wipe == true) {
	draw_surface_part(global.shopSurf,0,0,xp2-xp,height,xp,yp);
	wipe = false;
}